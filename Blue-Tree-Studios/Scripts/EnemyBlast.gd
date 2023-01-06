extends Area2D

const SPEED = 500
var velocity = Vector2()
var direction = 1


onready var Game = get_node("/root/Boss")

func set_plasmablast_direction(dir):
	direction = dir
	if dir == -1:
		$AnimatedSprite.flip_h = true

func _physics_process(delta):
	translate(velocity)
	velocity.x = SPEED * delta * direction
	$AnimatedSprite.play("shoot")
	var bodies = get_overlapping_bodies()
	for b in bodies:
		if b.name == "Player":
			Game.update_lives(-1)
			queue_free()
	
	

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
