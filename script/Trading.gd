extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var buyButtom = preload("res://object/buybuttom.tscn")
onready var sellButtom = preload("res://object/Sellbuttom.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.connect("nextSeason",self,"setup")
	setup()

func _physics_process(_delta):
	if Input.is_action_just_pressed("openTrading"):
		if $".".visible == true:
			$".".visible = false
		else:
			$".".visible = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func setup():
	var i = 0
	for s in $TextureRect.get_children():
		var texture = load("res://import/mushroom/PNG/without_shadow/" + String(i+1) + ".png")
		s.get_node("background/Image").texture = texture
		s.get_node("Name").text = Global.itemName[i]
		var buy = buyButtom.instance()
		var random = randi()%3+Global.season
		buy.price = random
		buy.itemName = Global.itemName[i]
		buy.position = Vector2(s.position.x,$TextureRect2.rect_position.y+5)
		$".".add_child(buy)
		var sell =sellButtom.instance()
		sell.price = random -1
		sell.itemName = Global.itemName[i]
		sell.position = Vector2(s.position.x,$TextureRect2.rect_position.y+85)
		$".".add_child(sell)
		i += 1
