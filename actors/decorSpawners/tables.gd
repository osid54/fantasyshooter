extends Node2D

var t1
var t2

func _ready():
	t1 = $tableSmall
	t2 = $tableSmall2
	
	t1.position.y += randi_range(-2,2)
	t1.position.x -= randi_range(0,1)
	
	t2.position.y += randi_range(-2,2)
	t2.position.x += randi_range(0,1)
