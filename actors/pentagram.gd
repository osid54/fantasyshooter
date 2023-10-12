extends Node2D

var enemy = preload("res://actors/goblin.tscn")
var sprites = [preload("res://sprites/penta/good/penta (1).png"), preload("res://sprites/penta/good/penta (4).png")]
var spawnLocation
@export var hitParticles : PackedScene

func _ready():
	position += Vector2(randi_range(-3,3),randi_range(-3,3))
	$Sprite2D.texture = sprites.pick_random()
	$Sprite2D.flip_h = 1==randi_range(0,1)
	$Sprite2D.flip_v = 1==randi_range(0,1)
	spawnLocation = get_tree().root.get_node("main/enemies")
	

func _process(_delta):
	if Input.is_action_just_pressed("space"):
		var e = enemy.instantiate()
		e.position = global_position
		spawnLocation.add_child(e)
		$AnimationPlayer.play("glow")
		var p = hitParticles.instantiate()
		add_child(p)
