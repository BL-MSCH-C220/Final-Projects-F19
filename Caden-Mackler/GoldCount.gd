extends Label

var CoinBag = 0


func _ready():
	text = String(CoinBag)
	
func _on_Coin_Bag_Collected():
	CoinBag = CoinBag + 1
	_ready()
