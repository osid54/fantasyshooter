extends Node2D

var t

func _ready():
	t = $tableLarge
	t.position.x += randi_range(-2,2)
	t.position.y += randi_range(-2,2)
