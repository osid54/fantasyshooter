extends TileMap

var options = [Vector2i(2,1),Vector2i(3,1),Vector2i(3,2)]
var wallOptions = [Vector2i(6,4),Vector2i(7,4),Vector2i(8,4),Vector2i(6,5),Vector2i(8,5)]
var wallTiles = [-5,-4,-2,-1,0,1,3,4]

func _process(_delta):
	if Input.is_action_just_pressed("furniture"):
		for i in range(-5,5,1):
			for j in range(-5,5,1):
				set_cell(0,Vector2i(i,j),0,options.pick_random())
		for i in wallTiles:
			set_cell(0,Vector2i(i,-6),0,wallOptions.pick_random())
			set_cell(1,Vector2i(i,5),0,wallOptions.pick_random())
