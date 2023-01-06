extends Area

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "CharacterV2":
			#player needs to be whatever our player model is.
			get_tree().change_scene("res://Scenes/Credits scene.tscn")
			#world2 can be whatever the next scene is.