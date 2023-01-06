extends Node2D

var timer 


func _init():
	timer = Timer.new()
	add_child(timer)
	timer.autostart = true
	timer.wait_time = 3
	timer.connect("timeout", self, "_timeout")
	
func _timeout():
		get_tree().change_scene("res://Scenes/Trans1.tscn")