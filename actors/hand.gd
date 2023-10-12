extends Node2D

func _physics_process(_delta):
	rotate(get_angle_to(get_global_mouse_position()))
