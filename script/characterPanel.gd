extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func setName(charN):
	$TextureRect3/NameArea/Label.text = charN
	$TextureRect3/name.text = "Name: "+ charN
func setAge(charA):
	$TextureRect3/age.text = "Age: "+charA
func setSkill(charS):
	$TextureRect3/skill.text = "Skill: " + charS
func setReputation(charR):
	$TextureRect3/reputation.text = "Reputation: " +charR
func setImage(charI):
	$TextureRect3/PhotoArea.texture = charI


func _on_TextureRect4_pressed():
	$".".hide()
	$"../..".movement = true
