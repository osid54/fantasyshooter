extends Node2D
class_name Weapon

@export var projectile : PackedScene
@export var spawnParticles : GPUParticles3D
@export var hitParticles : GPUParticles3D

@export var damage : int
@export var acceleration := 0
@export var lifetime : int
@export var speed : int
@export var attackDelay := 0.0

var justAttacked := false

func _ready():
	pass

func _process(_delta):
	if !justAttacked:
		if Input.is_action_just_pressed("shoot"):
			attack()

func attack():
	var p = projectile.instantiate()
	setProj(p)
	get_tree().root.add_child(p)
	justAttacked = true
	$AnimationPlayer.play("attack")
	await get_tree().create_timer(attackDelay).timeout
	justAttacked = false

func setProj(p: Area2D):
	p.position = $source.global_position
	p.rotation = $source.global_rotation
	p.speed = speed
	p.target = get_parent().position.direction_to(get_global_mouse_position())

func reset():
	$AnimationPlayer.play("reset")
