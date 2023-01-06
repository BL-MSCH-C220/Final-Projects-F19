extends Area2D



func _on_Area2D_body_entered(body):
	if body.name == "KinematicBody2D":
		get_tree().change_scene("res://Scenes/Boss.tscn")


func _on_Area2D_area_entered(area):
	get_tree().change_scene("res://Scenes/Boss.tscn")
