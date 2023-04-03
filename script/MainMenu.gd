extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(String, FILE, "*.tres") var dialogue = null
export(String) var speaker
var convo

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.resetGlobal()
	Global.connect("changeScene",self,"loadToDistrict")
	if dialogue != null:
		convo = load(dialogue)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	$Button.hide()
	$Button2.hide()
	var dia = DialogueManager.show_example_dialogue_balloon(speaker, convo)
	#get_tree().change_scene("res://scene/District19.tscn")

func loadToDistrict():
	get_tree().change_scene("res://scene/District19.tscn")
