extends KinematicBody2D

const SPEED = 250
const GRAVITY = 10
const GRAVITY2 = 100
const JUMP_POWER = -500
const FLOOR = Vector2(0, -1)


const PLASMABLAST = preload("res://Scenes/PlasmaBlast.tscn")

onready var World = get_node("/root/Boss")


var velocity = Vector2()

var jump = false
var jump_speed = 10
var on_ground = false
var can_move = true
var is_attacking = false

func _physics_process(delta):
	if Input.is_action_pressed("forward"):
		if is_attacking == false || is_on_floor() == false:
			velocity.x = SPEED
			if is_attacking == false:
				$AnimatedSprite.play("run")
				$AnimatedSprite.flip_h = false
				if sign($Position2D.position.x) == -1:
					$Position2D.position.x *= -1
	elif Input.is_action_pressed("backward"):
		if is_attacking == false || is_on_floor() == false:
			velocity.x = -SPEED
			if is_attacking == false:
				$AnimatedSprite.play("run")
				$AnimatedSprite.flip_h = true
				if sign($Position2D.position.x) == 1:
					$Position2D.position.x *= -1
	else:
		velocity.x = 0
		if on_ground == true && is_attacking == false:
			$AnimatedSprite.play("idle")
	
	if Input.is_action_pressed("jump"):
		if is_attacking == false:
			if on_ground == true:
				velocity.y = JUMP_POWER
				$AnimatedSprite.play("jump")
				on_ground == false
	if Input.is_action_just_pressed("shoot") && is_attacking == false:
		if is_on_floor():
			velocity.x = 0
			is_attacking = true
		$AnimatedSprite.play("attack")
		var plasmablast = PLASMABLAST.instance()
		if sign($Position2D.position.x) == 1:
			plasmablast.set_plasmablast_direction(1)
		else:
			plasmablast.set_plasmablast_direction(-1)
		get_parent().add_child(plasmablast)
		plasmablast.position = $Position2D.global_position
	
	velocity.y += GRAVITY
	
	if is_on_floor():
		if on_ground == false:
			is_attacking = false
			on_ground = true
	else:
		if is_attacking == false:
			on_ground = false
	 if position.y > get_viewport_rect().end.y:
			get_tree().change_scene("res://Scenes/YouLose.tscn")
	
	velocity = move_and_slide(velocity, FLOOR)


	
	


	
func _on_AnimatedSprite_animation_finished():
	is_attacking = false


func _on_Player_animation_finished():
	pass # Replace with function body.
	
	


func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://Scenes/Transition.tscn")

func _on_Enemy_body_entered(body):
	if can_move:
		World.update_lives(-1)
		velocity *= -1
		velocity.y = jump_speed
		move_and_slide(velocity, Vector2.UP, true)
		can_move = false
	yield(get_tree().create_timer(1), "timeout")
	can_move = true