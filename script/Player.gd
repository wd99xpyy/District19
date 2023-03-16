extends KinematicBody2D

onready var anim = $PlayerSprites
export (int) var speed = 200
var velocity = Vector2()
var currentdirection = ""

func _ready():
	$PlayerSprites.animation = "idle"
	
func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)

func get_input():
	velocity = Vector2()
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
