extends Area2D

var direction = Vector2()
var vel := Vector2()
var speed := 50
var target := Vector2()
var player
var inRange := false

func _ready():
	$AnimationPlayer.play("idle")
	player = get_tree().root.get_node("main/player")
	target = player.get_node("CollisionShape2D").global_position 

func _process(_delta):
	if inRange:
		target = player.get_node("CollisionShape2D").global_position
		direction = global_position.direction_to(target)
		$RayCast2D.target_position = target - position

func _physics_process(delta):
	if inRange and !$RayCast2D.is_colliding():
		vel = vel.move_toward(direction * speed, 200 * delta)
	else:
		vel = vel.move_toward(Vector2.ZERO, 200 * delta)
	position += vel * delta
	
func potionGet(body):
	body.changeHealth(1)
	queue_free()
	
func playerDetected(_body):
	inRange = true

func playerLeft(_body):
	inRange = false
