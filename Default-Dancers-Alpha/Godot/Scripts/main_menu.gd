extends CanvasLayer

var menu

func _ready():
	menu = $menu
	
func _on_Play_pressed():
	get_tree().change_scene("res://Scenes/RealWorld.tscn") #Change to the game

func _on_Quit_pressed():
	get_tree().quit()