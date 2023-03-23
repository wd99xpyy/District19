extends KinematicBody2D

export(SpriteFrames) var playerSprite = null
export (int) var speed = 200
export (int) var PlayerN
export (String) var PlayerName
export (String) var age
export (String) var reputation
export (String) var skill
export (Texture) var image
var movement= false
var velocity = Vector2()
var currentdirection = ""

func _ready():
	$PlayerSprites.frames = playerSprite
	$PlayerSprites.animation = "idle"

func _physics_process(_delta):
	if(movement):
		get_input()
		velocity = move_and_slide(velocity)
	else:
		$PlayerSprites.animation = "idle"+currentdirection
		if $CanvasLayer/characterDetail.visible:
			if Input.is_action_just_pressed("characterPage"):
				$CanvasLayer/characterDetail.hide()
				movement = true

func active():
	movement= true
	$Camera2D.current = true
	
func disactive():
	movement= false
	$Camera2D.current = false

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("switchScene"):
		get_tree().change_scene("res://scene/Forest.tscn")
		
	if Input.is_action_pressed("right"):
		velocity.x += 1
		currentdirection = "Right"
	if Input.is_action_pressed("left"):
		velocity.x -= 1
		currentdirection = "Left"
	if Input.is_action_pressed("down"):
		velocity.y += 1
		currentdirection = ""
	if Input.is_action_pressed("up"):
		velocity.y -= 1
		currentdirection = "Up"
	if Input.is_action_pressed("acc"):
		speed = 350
		$PlayerSprites.speed_scale = 3
	else:
		speed = 200
		$PlayerSprites.speed_scale = 1.5
	if velocity == Vector2.ZERO:
		$PlayerSprites.animation = "idle"+currentdirection
	else:
		$PlayerSprites.animation = "walk"+currentdirection
	velocity = velocity.normalized() * speed
	if Input.is_action_just_pressed("characterPage"):
		$CanvasLayer/characterDetail.show()
		$CanvasLayer/characterDetail.setName(PlayerName)
		$CanvasLayer/characterDetail.setAge(age)
		$CanvasLayer/characterDetail.setReputation(reputation)
		$CanvasLayer/characterDetail.setSkill(skill)
		$CanvasLayer/characterDetail.setImage(image)
		movement = false
