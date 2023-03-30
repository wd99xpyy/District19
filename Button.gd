extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (String) var buttontext = "Start"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = buttontext


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_mouse_entered():
	$TextureRect.show()


func _on_Button_mouse_exited():
	$TextureRect.hide()
