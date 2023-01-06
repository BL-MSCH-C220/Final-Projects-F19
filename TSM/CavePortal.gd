extends Area2D

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.is_in_group("Player"):
			body.queue_free()
			get_tree().change_scene("Level2.tscn")