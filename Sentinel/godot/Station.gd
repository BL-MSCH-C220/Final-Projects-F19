extends KinematicBody2D

# Declare member variables here. Examples:
var light_damage = preload("res://sprites/2scale/base50.png")
var heavy_damage = preload("res://sprites/2scale/base20.png")
onready var sprite = get_node("Hull/HullSprite")
var INITIAL_MOVE_SPEED = .005
var move_speed = INITIAL_MOVE_SPEED
var health = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("move_left") and get_rotation_degrees() >= -22.5:
		rotate(-move_speed)
	if Input.is_action_pressed("move_right") and get_rotation_degrees() <= 22.5:
		rotate(move_speed)
	if health == 50:
		sprite.texture = light_damage
	if health == 20:
		sprite.texture = heavy_damage
	if health <= 0:
		get_tree().quit()