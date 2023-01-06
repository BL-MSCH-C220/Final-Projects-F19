extends Control

func _ready():
	$Button.grab_focus()
func _input(event):
	if event.is_action_pressed("pause"):
		$Button.grab_focus()
		get_tree().paused = not get_tree().paused
		visible = not visible

func _on_Button_pressed():
		get_tree().paused = not get_tree().paused
		visible = not visible


func _on_Button2_pressed():
	get_tree().quit()
