extends CharacterBody2D

@export var speed := 200
@export var accel := 1000
@export var friction := 1000
@export var healParticles : PackedScene

var health := 5
var direction : Vector2
var healthBar
var dashing = false
var dashable = true
var startSpeed

func _ready():
	healthBar = get_tree().root.get_node("main/UI/healthBar")
	startSpeed = speed
	$dashParticles.emitting = false

func _process(_delta):
	if Input.is_action_just_pressed("furniture"):
		position = Vector2()
	if Input.is_action_just_pressed("dash"):
		if dashable:
			dashable = false
			dash()
	if direction.length()==0:
		$AnimatedSprite2D.play("idle")
	else:
		$AnimatedSprite2D.play("walking")
		
	if direction.x > 0:
		$AnimatedSprite2D.flip_h = false
		$Hand.position.x = 2
	elif direction.x < 0:
		$AnimatedSprite2D.flip_h = true
		$Hand.position.x = -2
		
func _physics_process(delta):
	direction = Vector2.ZERO
	direction = Input.get_vector("left", "right", "up", "down")
	direction = direction.normalized()
	
	if dashing:
		speed = startSpeed * 10
	else:
		speed = startSpeed
	if direction != Vector2.ZERO:
		velocity = velocity.move_toward(speed * direction, accel * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	move_and_slide()

func changeHealth(h: int):
	health += h
	if h<0:
		$AnimatedSprite2D/ColorRect.color = "WHITE"
		get_tree().root.get_node("main/Camera2D").shake(.1,.5)
	else:
		$AnimatedSprite2D/ColorRect.color = "GREEN"
		var p = healParticles.instantiate()
		p.position = global_position
		p.modulate = "GREEN"
		get_parent().add_child(p)
	$AnimationPlayer.play("hit")
	if health<0 or health>5:
		health = clamp(health,0,5)
	else:
		healthBar.updateHealth(h)

func dash():
	$AnimatedSprite2D/ColorRect.color = "CYAN"
	dashing = true
	$dashParticles.modulate = "CYAN"
	$dashParticles.emitting = true
	$AnimationPlayer.play("hit")
	await get_tree().create_timer(.2).timeout
	dashing = false
	await get_tree().create_timer(.1).timeout
	$dashParticles.emitting = false
	await get_tree().create_timer(1).timeout
	dashable = true
