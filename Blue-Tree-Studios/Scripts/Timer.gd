extends Timer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.





func _on_Transition_ready():
		$Timer.start()
		if $Timer.stop():
			get_tree().change_scene("res://Scenes/Boss.tscn")
