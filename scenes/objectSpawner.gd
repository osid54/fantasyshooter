extends Node2D

var options = [
	[preload("res://actors/decorSpawners/bigTable.tscn"), 
	preload("res://actors/decorSpawners/bookshelves.tscn"),
	null],
	[preload("res://actors/decorSpawners/barrels.tscn"), 
	preload("res://actors/decorSpawners/tables.tscn"),
	null]
	]

var positions = []

func _ready():
	positions.append([$pos1,$pos2,$pos3])
	positions.append([$pos4,$pos5,$pos6,$pos7,$pos8])

func _process(_delta):
	if Input.is_action_just_pressed("furniture"):
		for i in options.size():
			for x in positions[i]:
				for child in x.get_children():
					child.queue_free()
				var obj = options[i].pick_random()
				if obj != null:
					x.add_child(obj.instantiate())
