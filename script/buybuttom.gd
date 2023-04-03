extends Node2D

var itemName
var price = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = "$" + String(price) + " Buy"
	

func _on_Button_pressed():
	if Global.coin >= price:
		Global.invetory.push_back(itemName)
		Global.coin -= price
		Global.collectInvetory()
	else:
		$ColorRect.show()
		$Timer.start()




func _on_Timer_timeout():
	$ColorRect.hide()
