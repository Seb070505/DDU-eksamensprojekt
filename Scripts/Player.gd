extends KinematicBody2D

onready var animation = $AnimationPlayer

var speed = 100
var score = 0
var idle = true
var pickUp_ip = false


func _physics_process(delta):
	var velocity = Vector2.ZERO * delta
	
	interact_and_pickUp()
	
	if Input.is_action_pressed("move_up") and pickUp_ip == false:
		velocity.y -= 1
		idle = false
		animation.play("walk back")
	
	elif Input.is_action_pressed("move_down") and pickUp_ip == false:
		velocity.y += 1
		idle = false
		animation.play("walk front")
	
	elif Input.is_action_pressed("move_left") and pickUp_ip == false:
		velocity.x -= 1
		idle = false
		animation.play("walk left")
	
	elif Input.is_action_pressed("move_right") and pickUp_ip == false:
		velocity.x += 1
		idle = false
		animation.play("walk right")
	
	if velocity.x == 0 and velocity.y == 0 and pickUp_ip ==  false:
		idle = true
		idle_animation()
	
	velocity = velocity.normalized()
	move_and_slide(velocity * speed)
	
	

func interact_and_pickUp():
	if Input.is_action_pressed("Interact") and Global.interactZone == true:
		Global.interact = true
	
	if Global.interactZone == true and Global.interact == false:
		$Interact/Label.visible = true
	else:
		$Interact/Label.visible = false
	
	if Input.is_action_pressed("pickUp") and Global.pickUpZone == true:
		Global.pickUp = true
		pickUp_ip = true
		print(pickUp_ip)
		if Input.is_action_just_released("move_down"):
			animation.play("pick up front")
		elif Input.is_action_just_released("move_up"):
			animation.play("pick up back")
		elif Input.is_action_just_released("move_left"):
			animation.play("pick up left")
		elif Input.is_action_just_released("move_right"):
			animation.play("pick up right")
		
		if pickUp_ip == true:
			$pickUp_ip.start()
	
	if Global.pickUpZone == true and Global.pickUp == false:
		$Interact/Label2.visible = true
	else:
		$Interact/Label2.visible = false

func idle_animation():
	if idle == true:
		if Input.is_action_just_released("move_down"):
			animation.play("idle front")
		elif Input.is_action_just_released("move_up"):
			animation.play("idle back")
		elif Input.is_action_just_released("move_left"):
			animation.play("idle left")
		elif Input.is_action_just_released("move_right"):
			animation.play("idle right")
	

func player():
	pass


func collected_music(value):
	score += value


func _on_pickUp_ip_timeout():
	pickUp_ip = false
	print("pickUp_ip er")
	print(pickUp_ip)
