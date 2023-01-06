extends Node2D

# Declare member variables here. Examples:
var score_last_tick = 0
var money_last_tick = 0
var score = 0
var money = 0
var new_bomber = preload("res://scenes/DiveBomber.tscn")
var bomber_frequency = 200
var ticks_since_bomber = 0
var spawn_locations = [100,200,300,400,500,600,700]
var last_spawn = 0
var new_blaster = preload("res://scenes/Blaster.tscn")
var blaster_frequency = 200
var ticks_since_blaster = 100

var health = 4

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if score != score_last_tick:
		get_node("Score").update_score()
	if money != money_last_tick:
		get_node("Money").update_money()
	ticks_since_bomber += 1
	ticks_since_blaster += 1
	
	if ticks_since_bomber > bomber_frequency:
		var spawn = last_spawn
		var bomber = new_bomber.instance()
		while spawn == last_spawn:
			randomize()
			spawn = rand_range(0,7)
		bomber.position = Vector2(spawn_locations[spawn], -30)
		add_child(bomber)
		ticks_since_bomber = 0
		last_spawn = spawn
	
	if ticks_since_blaster > blaster_frequency:
		var spawn = last_spawn
		var blaster = new_blaster.instance()
		while spawn == last_spawn:
			randomize()
			spawn = rand_range(0,7)
		blaster.position = Vector2(spawn_locations[spawn], -30)
		add_child(blaster)
		ticks_since_blaster = 0
	
	
	if health == 3:
		get_node("Heart").visible = false
	if health == 2:
		get_node("Heart2").visible = false
	if health == 1:
		get_node("LastHeart").visible = false
	if health == 0:
		get_tree().quit()
	
