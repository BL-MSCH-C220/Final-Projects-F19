extends Sprite

func _input(event):
 if event is InputEventMouseButton and event.pressed:
		get_tree().change_scene("res://Scenes/Main.tscn")
