extends Node2D

var SPEED = 0.93
var direction = Vector2(SPEED,0)

func _process(delta):
	position += direction
#Dectect MC