extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var currentlyPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	currentlyPlayer = $Player/Player1
	currentlyPlayer.active()
	
	# Stupid way to load the correct task list when reload the scene
	if Global.timeH <1:
		#$CanvasLayer/TaskList/TextureRect/Task.queue_free()
		$NPC/EVA.convo = null
		$CanvasLayer/TaskList.get_node("TextureRect").remove_child($CanvasLayer/TaskList.get_node("TextureRect").get_child(0))
		$CanvasLayer/DateandTime.StartTime()
		if Global.EmmaTask == "":
			$CanvasLayer/TaskList.addTask("Talk with Emma", "EVA")
			$NPC/Emma.setDialogue()
		else:
			$CanvasLayer/TaskList.addTask(Global.EmmaTask + "(" + String(Global.EmmaTasknum) + ")", "Emma")
			$NPC/Emma.unsetDialogue("Emma")
		if Global.JacksonTask == "":
			$CanvasLayer/TaskList.addTask("Talk with Jackson", "EVA")
			$NPC/Jackson.setDialogue()
		else:
			$CanvasLayer/TaskList.addTask(Global.JacksonTask + "(" + String(Global.JacksonTasknum) + ")", "Jackson")
			$NPC/Jackson.unsetDialogue("Jackson")
		if Global.LucasTask == "":
			$CanvasLayer/TaskList.addTask("Talk with Lucas", "EVA")
			$NPC/Lucas.setDialogue()
		else:
			$CanvasLayer/TaskList.addTask(Global.LucasTask + "(" + String(Global.LucasTasknum) + ")", "Lucas")
			$NPC/Lucas.unsetDialogue("Lucas")
		if Global.OliverTask == "":
			$CanvasLayer/TaskList.addTask("Talk with Oliver", "EVA")
			$NPC/Oliver.setDialogue()
		else:
			$CanvasLayer/TaskList.addTask(Global.OliverTask + "(" + String(Global.OliverTasknum) + ")", "Oliver")
			$NPC/Oliver.unsetDialogue("Oliver")
						
	
	
func _physics_process(_delta):
	pass


