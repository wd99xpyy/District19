extends Node2D

signal timeout
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.connect("SeasonBegin",self,"StartTime")

func StartTime():
	$Timer.start()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func setTime(season,timeH,timeM,timeS):
	var textC = "Season " + String(season) + " - (" + String(timeH) + ":" + String(timeM) + ":" + String(timeS) + ")"
	$TextureRect/Label.text = textC

func _on_Timer_timeout():
	if Global.timeS > 0:
		Global.timeS -= 1
	else:
		if Global.timeM > 0:
			Global.timeM -= 1
			Global.timeS = 59
		else:
			if Global.timeH > 0:
				Global.timeH -= 1
				Global.timeM = 59
				Global.timeS = 59
			else:
				if checkAlive():
					NextSeason()
				else:
					get_tree().change_scene("res://scene/MainMenu.tscn")
	setTime(Global.season,Global.timeH,Global.timeM, Global.timeS)

func NextSeason():
	Global.season += 1
	Global.timeH = 1
	Global.timeM = 0
	Global.timeS = 0
	Global.resetTask()
	Global.emit_signal("nextSeason")

func checkAlive():
	var TaskListItem = []
	TaskListItem.push_back(Global.EmmaTask)
	TaskListItem.push_back(Global.JacksonTask)
	TaskListItem.push_back(Global.LucasTask)
	TaskListItem.push_back(Global.OliverTask)
	var TaskListItemNum = []
	TaskListItemNum.push_back(Global.EmmaTasknum)
	TaskListItemNum.push_back(Global.JacksonTasknum)
	TaskListItemNum.push_back(Global.LucasTasknum)
	TaskListItemNum.push_back(Global.OliverTasknum)
	for item in TaskListItem:
		if item == "":
			return false
		var itemInInventory = false
		var i = 0 
		for collectItem in Global.collectedInvetory:
			if item == collectItem:
				Global.collectedNum[i] -= TaskListItemNum[i]
				if Global.collectedNum[i]<0:
					return false
				else:
					itemInInventory = true
			i+=1
		if itemInInventory == false:
			return false
	return true


