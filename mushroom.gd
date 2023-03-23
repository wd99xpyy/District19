extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var isPlayerHere = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
			
func _physics_process(_delta):
	if Input.is_action_just_pressed("pickup"):
		if isPlayerHere:
			print("pickup")
			Global.invetory.push_back("mushroom")
			print(Global.invetory)
			queue_free()

func _on_Area2D_body_entered(body):
	if body.name.begins_with("Player"):
		isPlayerHere = true
		print(isPlayerHere)


func _on_Area2D_body_exited(body):
	if body.name.begins_with("Player"):
		isPlayerHere = false
