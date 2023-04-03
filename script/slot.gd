extends Node2D

#export(Array) var itemImage
#export(Array) var itemName = ["White Mushroom","Diamond Mushroom","Red Mushroom","Brown Mushroom","Umbrella Mushroom","BlueRed Mushroom","Green Mushroom","Blue Mushroom","RedRoot Mushroom","Purple Mushroom"]

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func setSlot(name,num):
	var itemIndex = 0
	for thename in Global.itemName:
		if thename == name:
			var texture = load("res://import/mushroom/PNG/without_shadow/" + String(itemIndex+1) + ".png")
			$background/Image.texture = texture
			$Name.text = Global.itemName[itemIndex]
			$background/amount.text = String(num)
		else:
			itemIndex += 1
			
			
func resetSlot():
	$background/Image.texture = null
	$Name.text = ""
	$background/amount.text = ""
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
