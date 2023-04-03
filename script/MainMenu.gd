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
func _on_Button_pressed():
	$Button.hide()
	$Button2.hide()
	var dia = DialogueManager.show_example_dialogue_balloon(speaker, convo)
	#get_tree().change_scene("res://scene/District19.tscn")
func loadToDistrict():
	get_tree().change_scene("res://scene/District19.tscn")


func _on_Button2_pressed():
	$credit.show()


func _on_ColorRect_mouse_entered():
	$Node2D.position = Vector2(0,75)


func _on_ColorRect_mouse_exited():
	$Node2D.position = Vector2(0,-104)
