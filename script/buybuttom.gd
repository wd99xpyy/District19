extends Node2D
#which item this bottom connect and price of it
var itemName
var price = 0



func _ready():
	$Label.text = "$" + String(price) + " Buy"
	
#buy item
func _on_Button_pressed():
	if Global.coin >= price:
		Global.invetory.push_back(itemName)
		Global.coin -= price
		Global.collectInvetory()
	else:
		$ColorRect.show()
		$Timer.start()
#timer for tip
func _on_Timer_timeout():
	$ColorRect.hide()
