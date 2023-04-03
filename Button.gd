extends Button

export (String) var buttontext = "Start"

func _ready():
	#the
	$Label.text = buttontext

# set effect when mouse enter
func _on_Button_mouse_entered():
	$TextureRect.show()

# set effect when mouse left
func _on_Button_mouse_exited():
	$TextureRect.hide()
