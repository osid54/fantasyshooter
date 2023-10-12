extends Area2D

var speed = 0
var target

func _ready():
	$AnimatedSprite2D.play("default")

func _physics_process(_delta):
	if position.length() >= 1000 or !$AnimatedSprite2D.is_playing():
		queue_free()

func _process(delta):
	position += target * speed * delta

func _on_body_entered(body):
	if body is TileMap:
		speed = 0
	if body.is_in_group("Enemy"):
		body.hit()
