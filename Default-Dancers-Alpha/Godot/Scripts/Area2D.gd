extends Area2D

func _on_Aread2D_body_entered(body):
    if body.get_name() == "character":
        if body.add_coins(1):
            queue_free()