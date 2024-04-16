extends KinematicBody2D

onready var animation = $AnimationPlayer

var speed = 50
var score = 0
var pickUp_ip = false
var idle = true

func _ready():
	$Interact/Panel.visible = false
	$Interact/Objective.visible = false
	$Interact/Musikplade.visible = false
	$Interact/MusikAfspiller.visible = false
	$Interact/SnakMedDatter.visible = false
	$Interact/TagBussen.visible = false



func _physics_process(delta):
	var velocity = Vector2.ZERO * delta
	
	interact_and_pickUp()
	objective()
	
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
		$Interact/InteractPanel.visible = true
	else:
		$Interact/Label.visible = false
		$Interact/InteractPanel.visible = false
	
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
		$Interact/PickUpPanel.visible = true
	else:
		$Interact/Label2.visible = false
		$Interact/PickUpPanel.visible = false


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


func objective():
	if Global.objektiv_musikplade == true:
		$Interact/Panel.visible = true
		$Interact/Objective.visible = true
		$Interact/Musikplade.visible = true
	
	if Global.objektiv_pladeAfspiller == true:
		$Interact/Musikplade.visible = false
		$Interact/MusikAfspiller.visible = true
	
	if Global.objektiv_datter == true:
		$Interact/MusikAfspiller.visible = false
		$Interact/SnakMedDatter.visible = true
	
	if Global.objektiv_tagBussen == true:
		$Interact/SnakMedDatter.visible = false
		$Interact/TagBussen.visible = true


