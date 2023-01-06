extends StaticBody2D

# Declare member variables here. Examples:
var new_bullet = preload("res://scenes/GoodBullet.tscn")
var TICKS_BETWEEN_BULLETS = 20
var ticks = 0 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mouse = get_global_mouse_position()
	look_at(mouse)
	ticks += 1
	if Input.is_action_pressed("shoot") and ticks > TICKS_BETWEEN_BULLETS:
		var outer_rotation = get_parent().get_parent().rotation
		var bullet = new_bullet.instance()
		bullet.position = global_position - Vector2(-50,0).rotated(rotation).rotated(outer_rotation)
		bullet.look_at(mouse)
		bullet.linear_velocity = Vector2(400,0).rotated(rotation).rotated(outer_rotation)
		get_tree().get_root().add_child(bullet)
		ticks = 0
