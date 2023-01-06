extends Control


var new_ally = preload("res://scenes/Ally.tscn")
var price = 500
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_Button_pressed():
	#CODE FOR CURRENCY HERE
	if get_parent().money > price:
		var ally = new_ally.instance()
		ally.position = Vector2(rand_range(100,700), 400)
		add_child(ally)
		get_parent().money -= price
