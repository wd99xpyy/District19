extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func setTask(taskinfo, character):
	if character == "":
		$Label.text = taskinfo
	else:
		$Label.text = character + ": " + taskinfo
	
func endwith(character):
	if $Label.text.ends_with(character):
		return true
	else:
		return false
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
