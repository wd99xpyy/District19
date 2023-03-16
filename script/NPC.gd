extends KinematicBody2D


export(String, FILE, "*.tres") var dialogue = null
export(String) var speaker
var convo
export(Array) var points
export(Vector2) var currentPoint
var endP
# Called when the node enters the scene tree for the first time.
func _ready():
	if dialogue != null:
		convo = load(dialogue)
	print(currentPoint)
	#Global.connect("setEndPoint", self, "setEndPoint")



func _on_conversation_body_entered(body):
	if body.name.begins_with("Player"):
		DialogueManager.show_example_dialogue_balloon(speaker, convo)


func _on_conversation_body_exited(body):
	if body.name.begins_with("Player"):
		DialogueManager.end_dialogue()

