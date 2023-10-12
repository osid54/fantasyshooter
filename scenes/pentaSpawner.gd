extends Node2D

var positions = []
var chosen = []
var amount := 0

var penta = preload("res://actors/pentagram.tscn")

func _ready():
	for child in get_children():
		positions.append(child)
		chosen.append(false)

func _process(_delta):
	if Input.is_action_just_pressed("furniture"):
		for i in get_child_count():
			if chosen[i]:
				positions[i].get_child(0).queue_free()
				chosen[i] = false
		amount = randi_range(1,3)
		for i in amount:
			var picked = randi_range(0,get_child_count()-1)
			if !chosen[picked]:
				positions[picked].add_child(penta.instantiate())
				chosen[picked] = true
