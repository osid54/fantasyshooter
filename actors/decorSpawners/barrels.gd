extends Node2D

var b
var bpos = [
	[Vector2(-2, -6), Vector2(10, -5), Vector2(5, 4), Vector2(-7, 1)],
	[Vector2(-6, -4), Vector2(6, -9), Vector2(9, 0), Vector2(-2, 4)],
	[Vector2(-7, -8), Vector2(5, -4), Vector2(7, 4), Vector2(-5, 8)],
	[Vector2(-6, 0), Vector2(3, -6), Vector2(9, 1), Vector2(2, 8)],
	[Vector2(-5, -4), Vector2(7, -3), Vector2(11, 5), Vector2(-2, 8)],
	[Vector2(-5, -6), Vector2(7, -3), Vector2(13, 4), Vector2(1, 6)],
	[Vector2(-1, -2), Vector2(11, -1), Vector2(7, 6), Vector2(-5, 7)],
	[Vector2(-7, -4), Vector2(10, -7), Vector2(6, 2), Vector2(-6, 6)]
]


func _ready():
	b = [$barrel, $barrel2, $barrel3, $barrel4]
	var chosen = randi_range(0,bpos.size()-1)
	for i in 4:
		b[i].position = bpos[chosen][i]

