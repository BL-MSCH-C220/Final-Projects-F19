extends Label

var coins = 0 

func _ready():
	text = String(coins)

func _on_CoinBag_Collected():
	coins = coins + 1
	_ready()
