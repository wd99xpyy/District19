extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var task = preload("res://object/Task.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.connect("SeasonBegin",self,"addTaskSeasonBegin")
	Global.connect("addSeasonalTask", self, "addSeasonalTask")
	Global.connect("nextSeason",self,"addSeasonalTask")

func removeTask(index):
	#$TextureRect.get_child(index).queue_free()
	$TextureRect.remove_child($TextureRect.get_child(index))
	var i = 0
	for t in $TextureRect.get_children():
		if i >= index:
			t.position = Vector2(t.position.x,t.position.y - 50)
		i += 1

func addTaskSeasonBegin():
	for i in $TextureRect.get_child_count():
		removeTask(i)
	addTask("Talk with Emma", "EVA")
	addTask("Talk with Jackson", "EVA")
	addTask("Talk with Lucas", "EVA")
	addTask("Talk with Oliver", "EVA")

	
func addTask(taskinfo, character):
	var theTask = task.instance()
	theTask.setTask(taskinfo, character)
	theTask.position = Vector2(15,100+$TextureRect.get_child_count()*50)
	$TextureRect.add_child(theTask)

	
func addSeasonalTask(character):
	var randomMushroom = randi() % 10
	var numofMushroom = randi() % (Global.season+1)+1
	Global.setTask(character,randomMushroom,numofMushroom)
	var index = 0
	for i in $TextureRect.get_children():
		if i.endwith(character):
			removeTask(index)
		index += 1
	addTask(Global.itemName[randomMushroom] + "(" + String(numofMushroom) + ")", character)

	

func _on_TextureRect_mouse_entered():
	$".".position = Vector2(0,0)
	

func _on_TextureRect_mouse_exited():
	$".".position = Vector2(-276,0)
