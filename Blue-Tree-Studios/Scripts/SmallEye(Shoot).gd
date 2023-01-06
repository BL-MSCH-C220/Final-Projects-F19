extends RigidBody2D


var BLAST = preload("res://Scenes/MiniEnemyBlast.tscn")
onready var Game = get_node("/root/Boss")

func _ready():
	set_contact_monitor(true)
	set_max_contacts_reported(4)
	$AnimatedSprite.play("MiniBoss")


func _on_Timer_timeout():
	if rand_range(0,8) > 0.8:
		var blast = BLAST.instance()
		blast.set_plasmablast_direction(-1)
		get_parent().add_child(blast)
		blast.position = $Position2D.global_position

func _physics_process(delta):
	var bodies = get_colliding_bodies()
	for b in bodies:
		if b.name == 'Player':
			Game.update_lives(-1)


