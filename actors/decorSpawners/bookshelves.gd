extends Node2D

var b1
var b2
var b3


func _ready():
	b1 = $bookshelf
	b2 = $bookshelf2
	b3 = $bookshelf3
	
	var b2v = randi_range(-1,1)
	
	b2.position.y += b2v
	if b2v < 0:
		pickRandom().position.y += randi_range(0,1)
	elif b2v > 0:
		pickRandom().position.y -= randi_range(0,1)
	else:
		pickRandom().position.y += randi_range(-1,1)
		
	if pickRandom() == b1:
		b1.position.x -= randi_range(0,1)
	else:
		b3.position.x += randi_range(0,1)

func pickRandom():
	if randi_range(0,1) == 0: return b1
	else: return b3
