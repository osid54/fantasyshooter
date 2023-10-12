extends TextureRect

func _process(_delta):
	if Input.is_action_just_pressed("furniture"):
		modulate = Color(randf(),randf(),randf(),1)
