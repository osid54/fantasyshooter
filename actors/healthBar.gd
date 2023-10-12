extends TextureRect

var displayedHealth = 5

func updateHealth(h: int):
	if h > 0:
		get_child(displayedHealth).grow()
	else:
		get_child(displayedHealth-1).shrink()
	displayedHealth += h
