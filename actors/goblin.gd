extends CharacterBody2D

@export var speed := 50
@export var deathParticles : PackedScene
@export var drop : PackedScene
var direction = Vector2()
var target = Vector2()
var player
var health = 3
var hittable = true

func _ready():
	$AnimatedSprite2D.play("idle")
	player = get_tree().root.get_node("main/player")
	target = player.get_node("CollisionShape2D").global_position
	speed += randi_range(-5,5)
	
func _process(_delta):
	target = player.get_node("CollisionShape2D").global_position
	direction = global_position.direction_to(target)
	$RayCast2D.target_position = target - position

func _physics_process(_delta):
	if $RayCast2D.is_colliding():
		velocity = Vector2()
		$AnimatedSprite2D.play("idle")
	else:
		velocity = direction * speed
		$AnimatedSprite2D.play("run")
	
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	elif velocity.x < 0:
		$AnimatedSprite2D.flip_h = true

	move_and_slide()

func hitPlayer(body):
	body.changeHealth(-1)
	$Area2D.set_deferred("monitoring", false)
	await get_tree().create_timer(1).timeout
	$Area2D.set_deferred("monitoring", true)
	
func hit():
	if hittable:
		health -= 1
		$AnimationPlayer.play("hit")
		hittable = false
		await get_tree().create_timer(.25).timeout
		hittable = true

func die():
	if health <= 0:
		var p = deathParticles.instantiate()
		p.position = global_position
		get_parent().add_child(p)
		if .3 >= randf_range(0,1):
			var d = drop.instantiate()
			d.position = global_position
			get_parent().add_child(d)
		queue_free()
