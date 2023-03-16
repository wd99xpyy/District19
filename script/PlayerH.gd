extends KinematicBody2D

var velocity = Vector2()
export (int) var xspeed = 300
export (int) var yspeed = 900
onready var enemy = $"../Enemy"
onready var sprite = $PlayerSprites
var attack = false
var lives = 5
var beAttack = false
signal effective_attack

func _ready():
	enemy.connect("effective_attack",self,"Hurt") 
	$"../Enemy2".connect("effective_attack",self,"Hurt") 
	$"../Enemy3".connect("effective_attack",self,"Hurt") 
	$"../Enemy4".connect("effective_attack",self,"Hurt") 

func _physics_process(_delta):
	if Input.is_action_pressed("switchScene"):
		get_tree().change_scene("res://scene/District19.tscn")
		
	
	if Input.is_action_pressed("acc"):
		xspeed = 600
		#$PlayerSprites.speed_scale = 5
	else:
		xspeed = 300
		#$PlayerSprites.speed_scale = 3
	
	var direction = get_direction()
	velocity.x = direction.x*xspeed
	if !$PlatformDetector.is_colliding():
		velocity.y += 45
	else:
		velocity.y = direction.y*yspeed
		
	if Input.is_action_pressed("attack"):
		attack = true
		velocity = Vector2.ZERO
	velocity = move_and_slide(velocity)
	if direction.x != 0:
		if direction.x > 0:
			sprite.scale.x = 1
		else:
			sprite.scale.x = -1
			
	var animation = get_new_animation()
	sprite.play(animation)
	
func get_direction():
	return Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		-1 if Input.is_action_just_pressed("jump") else 0
	)
func get_new_animation():
	var animation_new = ""		
	if $PlatformDetector.is_colliding():
		if attack:
			animation_new = "hit"
		elif abs(velocity.x) > 0.1 and Input.is_action_pressed("acc"):
			animation_new = "run"
		elif abs(velocity.x) > 0.1:
			animation_new = "walk"
		else:
			animation_new = "idle"
	else:
		animation_new = "jump"
		
	if beAttack:
		animation_new = "getHit"
	if lives <= 0:
		animation_new = "die"
	return animation_new


func _on_PlayerSprites_animation_finished():
	if sprite.animation == "hit":
		emit_signal("effective_attack")
		attack = false
	if sprite.animation == "die":
		queue_free()
		get_tree().change_scene("res://scene/District19.tscn")
	if sprite.animation == "getHit":
		beAttack = false

func Hurt():
	if beAttack == false:
		beAttack = true
		lives-=1
	
