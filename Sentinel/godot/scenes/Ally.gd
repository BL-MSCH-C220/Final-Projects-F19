extends RigidBody2D

var new_bullet = preload("res://scenes/GoodBullet.tscn")
var TICKS_BETWEEN_BULLETS = 50
var ticks = 0 
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _process(delta):
	ticks += 1
	if ticks > TICKS_BETWEEN_BULLETS:
		var bullet = new_bullet.instance()
		bullet.position = Vector2(position.x, position.y - 60)
		bullet.rotation_degrees = -90
		bullet.linear_velocity = Vector2(0,-200)
		get_parent().add_child(bullet)
		ticks = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
