extends Label

var people = 0

func _ready():
	text = String(people)
	


func _on_Bard_VillagerCollected():
	people = people + 1
	_ready()
	if people  == 3:
		$Timer.start()

func _on_Dude_VillagerCollected():
	people = people + 1
	_ready()
	if people  == 3:
		$Timer.start()


func _on_Lady_VillagerCollected():
	people = people + 1
	_ready()
	if people  == 3:
		$Timer.start()

func _on_Timer_timeout():
	get_tree().change_scene("res://Win.tscn")
	
