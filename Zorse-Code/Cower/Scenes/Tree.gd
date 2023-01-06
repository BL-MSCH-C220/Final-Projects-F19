extends Area2D


func _on_Tree_body_entered(body):
	if body.name == "Player":
		body.hidden = true


func _on_Tree_body_exited(body):
	if body.name == "Player":
		body.hidden = false