extends Node2D

signal timeout

func _ready():
	Global.connect("SeasonBegin",self,"StartTime")

func StartTime():
	$Timer.start()

#set the time show on top
func setTime(season,timeH,timeM,timeS):
	var textC = "Season " + String(season) + " - (" + String(timeH) + ":" + String(timeM) + ":" + String(timeS) + ")"
	$TextureRect/Label.text = textC

#based on hours minute and second, but I change the speed of the timer so it will be quicker
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
					get_tree().change_scene("res://scene/end.tscn")
	setTime(Global.season,Global.timeH,Global.timeM, Global.timeS)

#when timeout go to next Season
func NextSeason():
	Global.season += 1
	Global.timeH = 1
	Global.timeM = 0
	Global.timeS = 0
	Global.resetTask()
	Global.emit_signal("nextSeason")

#check is Player has enough resource to pass this season
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
	print("taskList")
	print(TaskListItem)
	print(TaskListItemNum)
	print("Inventory")
	print(Global.collectedInvetory)
	print(Global.collectedNum)
	var j = 0
	for item in TaskListItem:
		if item == "":
			print("not get all Task")
			return false
		var itemInInventory = false
		var i = 0 
		for collectItem in Global.collectedInvetory:
			if item == collectItem:
				Global.collectedNum[i] -= TaskListItemNum[j]
				if Global.collectedNum[i]<0:
					print("no enough mushroom")
					print(item)
					print(Global.collectedNum[i])
					return false
				else:
					itemInInventory = true
			i+=1
		if itemInInventory == false:
			print("do not have mushroom" + item)
			return false
		j += 1
	return true


