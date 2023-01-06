extends Area

signal CoinBagCollected

func _on_CoinBag_body_entered(body):
	emit_signal("CoinBagCollected")
	queue_free()
