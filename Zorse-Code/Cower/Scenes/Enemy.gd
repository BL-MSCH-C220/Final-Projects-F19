extends KinematicBody2D

onready var player = get_parent().get_node("Player")


var speed = 50

var velocity = Vector2.ZERO

func _physics_process(delta):
	if player.hidden:
		pass
	else :
		if player.position.x < position.x:
			velocity = Vector2(-speed,0)
		else:
			velocity = Vector2(speed,0)
		move_and_slide(velocity)
		if player.position.y < position.y:
			velocity = Vector2(0, -speed)
		else:
			velocity = Vector2(0, speed)
		move_and_slide(velocity)