extends Control

var new_shot = preload("res://scenes/PowerShot.tscn")
var price = 300
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _on_Button_pressed():
	if get_parent().money > price:
		var shot = new_shot.instance()
		shot.position = Vector2(400, 400)
		add_child(shot)
		get_parent().money -= price
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
