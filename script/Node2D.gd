extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label2.text = "You survival with your friend " + String(Global.season) + "season "


func _on_Timer_timeout():
	get_tree().change_scene("res://scene/MainMenu.tscn")
