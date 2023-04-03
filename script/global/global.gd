extends Node
signal Player_effective_attack
signal Enemy_effective_attack
signal changeScene
signal timeout
signal SeasonBegin
signal addSeasonalTask(character)
signal TaskNPCTalk
signal nextSeason
var coin = 0
var invetory = []
var collectedInvetory = []
var collectedNum = []
var itemName = ["White Mushroom","Diamond Mushroom","Red Mushroom","Brown Mushroom","Umbrella Mushroom","BlueRed Mushroom","Green Mushroom","Blue Mushroom","RedRoot Mushroom","Purple Mushroom"]
# var a = 2
# var b = "text"
var season = 1
var timeH = 1
var timeM = 0
var timeS = 0

var currentlyTaskList

var EmmaTask = ""
var EmmaTasknum = 0

var JacksonTask = ""
var JacksonTasknum = 0

var LucasTask = ""
var LucasTasknum = 0

var OliverTask = ""
var OliverTasknum = 0

func resetGlobal():
	coin = 0
	invetory = []
	collectedInvetory = []
	collectedNum = []
	itemName = ["White Mushroom","Diamond Mushroom","Red Mushroom","Brown Mushroom","Umbrella Mushroom","BlueRed Mushroom","Green Mushroom","Blue Mushroom","RedRoot Mushroom","Purple Mushroom"]
	season = 1
	timeH = 1
	timeM = 0
	timeS = 0
	resetTask()


func resetTask():
	EmmaTask = ""
	EmmaTasknum = 0

	JacksonTask = ""
	JacksonTasknum = 0

	LucasTask = ""
	LucasTasknum = 0

	OliverTask = ""
	OliverTasknum = 0

func setTask(character,TaskMushroom,Mushroomnum):
	if character == "Emma":
		EmmaTask = itemName[TaskMushroom]
		EmmaTasknum = Mushroomnum
	if character == "Jackson":
		JacksonTask = itemName[TaskMushroom]
		JacksonTasknum = Mushroomnum
	if character == "Lucas":
		LucasTask = itemName[TaskMushroom]
		LucasTasknum = Mushroomnum
	if character == "Oliver":
		OliverTask = itemName[TaskMushroom]
		OliverTasknum = Mushroomnum	
		
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func collectInvetory():
	for item in invetory:
		var itemisCollect = false
		var i = 0
		for Collectitem in collectedInvetory:
			if Collectitem == item:
				itemisCollect = true
				collectedNum[i]+=1
			else:
				i += 1
		if itemisCollect == false:
			collectedInvetory.push_back(item)
			collectedNum.push_back(1)
	invetory = []
	var pos = 0
	for i in collectedNum:
		if i <=0:
			collectedNum.remove_at(pos)
			collectedInvetory.remove_at(pos)
		else:
			pos +=1
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
