extends KinematicBody2D

onready var animation = $AnimationPlayer

var speed = 100
var score = 0
var pickUp_ip = false


func _physics_process(delta):
	var velocity = Vector2.ZERO * delta
	
	if Input.is_action_pressed("move_up") and pickUp_ip == false:
		velocity.y -= 1
		animation.play("walk back")
	
	elif Input.is_action_pressed("move_down") and pickUp_ip == false:
		velocity.y += 1
		animation.play("walk front")
	
	elif Input.is_action_pressed("move_left") and pickUp_ip == false:
		velocity.x -= 1
		animation.play("walk left")
	
	elif Input.is_action_pressed("move_right") and pickUp_ip == false:
		velocity.x += 1
		animation.play("walk right")
	
	
	velocity = velocity.normalized()
	move_and_slide(velocity * speed)
	
	
	if Input.is_action_pressed("Interact") and Global.interactZone == true:
		Global.interact = true
	
	if Global.interactZone == true and Global.interact == false:
		$Interact/Label.visible = true
	else:
		$Interact/Label.visible = false
	
	if Input.is_action_pressed("pickUp") and Global.pickUpZone == true:
		Global.pickUp = true
	
	if Global.pickUpZone == true and Global.pickUp == false:
		$Interact/Label2.visible = true
	else:
		$Interact/Label2.visible = false


func player():
	pass


func collected_music(value):
	score += value
