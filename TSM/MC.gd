extends KinematicBody2D

const SPEED = 60
const GRAVITY = 1
const JUMP_POWER = -57
const FLOOR = Vector2(0,-1)

var velocity = Vector2()

var on_ground = false

func _physics_process(delta):
	if Input.is_action_pressed("strafe_right"):
		velocity.x = SPEED
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("strafe_left"):
		velocity.x = -SPEED
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = true
	else:
		velocity.x = 0
		if on_ground == true:
			$AnimatedSprite.play("idle")
		
	if Input.is_action_pressed("jump"):
		if on_ground == true:
			velocity.y = JUMP_POWER
			on_ground = false
	
	velocity.y += GRAVITY
	
	if is_on_floor():
		on_ground = true
	else:
		on_ground = false
	velocity = move_and_slide(velocity,FLOOR)
	
	if position.y > get_viewport_rect().end.y:
		queue_free()
		get_tree().change_scene("Game.tscn")