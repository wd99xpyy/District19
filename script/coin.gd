extends Node2D


func _ready():
	pass 

#collect coin
func _on_Area2D_body_entered(body):
	if body.name.begins_with("Player"):
		Global.coin += 1
		print(Global.coin)
		queue_free()
