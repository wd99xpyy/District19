extends KinematicBody2D


export(String, FILE, "*.tres") var dialogue = null
export(String) var speaker
var convo
export(Array) var points
export(Vector2) var currentPoint
var endP
export(String) var NPCName
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.connect("TaskNPCTalk",self,"setDialogue")
	Global.connect("addSeasonalTask",self,"unsetDialogue")
	Global.connect("nextSeason",self,"setDialogue")
	if NPCName == "EVA":
		if dialogue != null:
			convo = load(dialogue)
	$NPCsprite.animation = NPCName
	#Global.connect("setEndPoint", self, "setEndPoint")

func setDialogue():
	if NPCName == "EVA":
		convo = null
	else:
		if dialogue != null:
			convo = load(dialogue)

func unsetDialogue(character):
	if NPCName == character:
		convo = null

func _on_conversation_body_entered(body):
	if convo != null:
		if body.name.begins_with("Player"):
			DialogueManager.show_example_dialogue_balloon(speaker, convo)


func _on_conversation_body_exited(body):
	if convo != null:
		if body.name.begins_with("Player"):
			DialogueManager.end_dialogue()

