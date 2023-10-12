extends Camera2D

var shake_amount : float = 0
var default_offset : Vector2 = offset
var pos_x : int
var pos_y : int
var shaking = false

@onready var timer : Timer = $Timer

func _process(_delta: float):
	if shaking:
		offset = Vector2(randf_range(-1, 1) * shake_amount, randf_range(-1, 1) * shake_amount)

func shake(time: float, amount: float):
	shake_amount = amount
	shaking = true
	await get_tree().create_timer(time).timeout
	shaking = false
	move()

func move() -> void:
	Tween.interpolate_value(self, "offset", 1, 1, Tween.TRANS_LINEAR, Tween.EASE_IN)
