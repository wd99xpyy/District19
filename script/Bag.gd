extends Node2D



func _ready():
	pass 

func _physics_process(_delta):
	#open and close
	if Input.is_action_just_pressed("openBag"):
		if $".".visible == true:
			$".".visible = false
		else:
			refreshBag()
			$".".visible = true
		

#set the item to the bags slot
func refreshBag():
	$TextureRect/Label.text = String(Global.coin)
	Global.collectInvetory()
	var i = 0
	for child in $inventory.get_children():
		if i < Global.collectedInvetory.size():
			child.setSlot(Global.collectedInvetory[i],Global.collectedNum[i])
			i += 1
		else:
			child.resetSlot()
			i += 1

