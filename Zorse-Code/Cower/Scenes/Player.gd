extends KinematicBody2D

const speed = 100

var hidden = false;

var keys = 0;

func _physics_process(delta):
	if Input.is_action_pressed("left"):
		move_and_slide(Vector2(-speed,0))
	if Input.is_action_pressed("right"):
		move_and_slide(Vector2(speed,0))
	if Input.is_action_pressed("up"):
		move_and_slide(Vector2(0,-speed))
	if Input.is_action_pressed("down"):
		move_and_slide(Vector2(0,speed))
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.name == "Enemy":
			get_tree().change_scene("res://Scenes/GameOver.tscn")
		if collision.collider.name == "Door" and keys > 0:
			collision.collider.queue_free()
			keys -= 1
		if collision.collider.name == "Door2" and keys > 0:
			collision.collider.queue_free()
			keys -= 1
		if collision.collider.name == "Door3" and keys > 0:
			collision.collider.queue_free()
			keys -= 1
		if collision.collider.name == "Door4" and keys > 0:
			collision.collider.queue_free()
			keys -= 1
		if collision.collider.name == "Door5" and keys > 0:
			collision.collider.queue_free()
			keys -= 1
