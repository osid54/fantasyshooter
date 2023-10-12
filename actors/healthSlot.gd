extends ColorRect

var tweenSpeed = 1

func grow():
	var tween = create_tween().set_parallel().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	tween.tween_property($TextureRect, "scale", Vector2(1,1), tweenSpeed)

func shrink():
	var tween = create_tween().set_parallel().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	tween.tween_property($TextureRect, "scale", Vector2(0,1), tweenSpeed)
