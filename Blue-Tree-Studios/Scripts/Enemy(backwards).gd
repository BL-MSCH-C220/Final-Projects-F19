extends RigidBody2D

onready var Game = get_node("/root/game")



func _ready():
	set_contact_monitor(true)
	set_max_contacts_reported(4)
	$AnimatedSprite.play("walk(backwards)")


func _physics_process(delta):
	var bodies = get_colliding_bodies()
	for b in bodies:
		if b.name == 'Player':
			Game.update_lives(-1)
	

	