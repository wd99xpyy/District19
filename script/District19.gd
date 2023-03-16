extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var currentlyPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	currentlyPlayer = $Player/Player1
	currentlyPlayer.active()
	
func _physics_process(_delta):
	if Input.is_action_just_pressed("switchCharacter"):
		switchPlayer()

func switchPlayer():
	currentlyPlayer.disactive()
	currentlyPlayer = get_next_Player()
	currentlyPlayer.active()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func get_next_Player():
	if currentlyPlayer.PlayerN<$Player.get_child_count():
		return $Player.get_child(currentlyPlayer.PlayerN)
	else:
		return $Player.get_child(0)
