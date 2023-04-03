extends KinematicBody2D

var velocity = Vector2()
export (int) var xspeed = 300
onready var sprite = $EnemySprite
var attack = false
var direction = Vector2.ZERO
var death = false

onready var coin = preload("res://object/coin.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.connect("Player_effective_attack",self,"Hurt") 

func _physics_process(_delta):
	#velocity.y += 45
	velocity = direction * xspeed
	move_and_slide(velocity)
	sprite.play(get_new_animation())

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#when player enter this area, enemy will walt to Player
func _on_SearchArea_body_entered(body):
	if body.name.begins_with("Player"):
		direction = Vector2(body.position.x - $".".position.x ,0).normalized()

#Attack when player in this area
func _on_AttackArea_body_entered(body):
	if body.name.begins_with("Player"):
		direction = Vector2.ZERO
		attack = true
#change animation base on it state
func get_new_animation():
	var animation_new = ""
	if attack:
		animation_new = "attack"
	elif abs(velocity.x) > 0.1:
		animation_new = "walk"
	else:
		animation_new = "idle"
	#print(animation_new)
	if death:
		animation_new = "death"
	return animation_new

#hurt by player
func Hurt():
	for body in $AttackArea.get_overlapping_bodies():
		if body.name.begins_with("Player"):
			death = true

#when player exist attackarea, stop attacked and follow
func _on_AttackArea_body_exited(body):
	if body.name.begins_with("Player"):
		attack = false
		direction = Vector2(body.position.x - $".".position.x ,0).normalized()

#stop when lose Plyaer position
func _on_SearchArea_body_exited(body):
	if body.name.begins_with("Player"):
		direction = Vector2.ZERO

#Determine whether the attack is complete
func _on_EnemySprite_animation_finished():
	if sprite.animation == "attack":
		Global.emit_signal("Enemy_effective_attack")
	if sprite.animation == "death":
		var dropCoin = coin.instance()
		dropCoin.position = $".".position
		get_parent().add_child(dropCoin)
		queue_free()
