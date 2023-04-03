extends ColorRect

func _ready():
	pass 


#set the value of character value
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
