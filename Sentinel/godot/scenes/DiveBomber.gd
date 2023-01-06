extends RigidBody2D

# Declare member variables here. Examples:
var money = 250

# Called when the node enters the scene tree for the first time.
func _ready():
	contact_monitor = true
	set_max_contacts_reported(4)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
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
			get_parent().get_node("Station").health -= 25
			queue_free()
		if body.is_in_group("ally"):
			body.queue_free()
		if body.is_in_group("powerShot"):
			queue_free()