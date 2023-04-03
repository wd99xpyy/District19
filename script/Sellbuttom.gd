extends Node2D
var itemName
var price = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = "$" + String(price) + " Sell"
	

func _on_Button_pressed():
	if checkA() == -1:
		$ColorRect.show()
		$Timer.start()
	else:
		Global.collectedNum[checkA()] -= 1
		Global.coin += price
		

func checkA():
	var i = 0
	for item in Global.collectedInvetory:
		if item == itemName:
			if Global.collectedNum[i]>0:
				return i
		i += 1
	return -1
	
func _on_Timer_timeout():
	$ColorRect.hide()
