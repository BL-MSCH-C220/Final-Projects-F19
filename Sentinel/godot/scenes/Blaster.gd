extends RigidBody2D

# Declare member variables here. Examples:
var new_bullet = preload("res://scenes/BadBullet.tscn")
var TICKS_BETWEEN_BULLETS = 50
var ticks = 0 
var money = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	contact_monitor = true
	set_max_contacts_reported(4)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ticks += 1
	if ticks > TICKS_BETWEEN_BULLETS:
		var bullet = new_bullet.instance()
		var bullet2 = new_bullet.instance()
		bullet.position = Vector2(position.x - 20, position.y + 20)
		bullet2.position = Vector2(position.x + 20, position.y + 20)
		bullet.linear_velocity = Vector2(0,200)
		bullet2.linear_velocity = Vector2(0,200)
		get_parent().add_child(bullet)
		get_parent().add_child(bullet2)
		ticks = 0
	var bodies = get_colliding_bodies()
	for body in bodies:
		if body.is_in_group("good"):
			get_parent().money += money
			get_parent().score += money
			body.queue_free()
			queue_free()
		if body.is_in_group("earth"):
			get_parent().health -= 1
			queue_free()
		if body.is_in_group("station"):
			get_parent().get_node("Station").health -= 15
			queue_free()
		if body.is_in_group("powerShot"):
			queue_free()
