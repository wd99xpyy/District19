extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	if Input.is_action_just_pressed("openBag"):
		if $".".visible == true:
			$".".visible = false
		else:
			refreshBag()
			$".".visible = true
		


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

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
