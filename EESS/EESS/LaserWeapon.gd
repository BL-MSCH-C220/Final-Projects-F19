extends Node2D

var laser_scene := load("res://scenes/laser.tscn")

func shoot():
	var laser = laser_scene.instance()
	laser.global_position = self.global_position
	get_node("/root/Game").add_child(laser)
