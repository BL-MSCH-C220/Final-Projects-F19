extends Camera

var spin = 0.025

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotate_x(lerp(0, spin, event.relative.y/10))