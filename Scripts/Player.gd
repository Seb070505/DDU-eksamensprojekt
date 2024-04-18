extends KinematicBody2D

onready var animation = $AnimationPlayer

var speed = 50
var score = 0
var pickUp_ip = false
var idle = true
var timer = false
var direction = Vector2.ZERO
var HospitalBus = Vector2(4050,50)
var Elevator1 = Vector2(1327.5, 1190)

func _ready():
	$SpriteSheet.visible = true
	$Interact/Panel.visible = false
	$Interact/Objective.visible = false
	$Interact/Musikplade.visible = false
	$Interact/MusikAfspiller.visible = false
	$Interact/SnakMedDatter.visible = false
	$Interact/TagBussen.visible = false
	$Interact/gaaIndPaaHospitalet.visible = false
	$Interact/snakMedReceptionisten.visible = false
	$Interact/tagElevatoren.visible = false
	$Interact/snakMedDoktor.visible = false
	$Camera2D.current = true



func _physics_process(delta):
	var velocity = Vector2.ZERO * delta
	
	interact_and_pickUp()
	objective()
	BusTur()
	Hospital_Elevator()
	
	if Input.is_action_pressed("move_up") and pickUp_ip == false:
		velocity.y -= 1
		direction.y = -1
		direction.x = 0
		idle = false
		animation.play("walk back")
	
	elif Input.is_action_pressed("move_down") and pickUp_ip == false:
		velocity.y += 1
		direction.y = 1
		direction.x = 0
		idle = false
		animation.play("walk front")
	
	elif Input.is_action_pressed("move_left") and pickUp_ip == false:
		velocity.x -= 1
		direction.x = -1
		direction.y = 0
		idle = false
		animation.play("walk left")
	
	elif Input.is_action_pressed("move_right") and pickUp_ip == false:
		velocity.x += 1
		direction.x = 1
		direction.y = 0
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
		timer = true
		print(pickUp_ip)
		if direction.y == 1 and Input.is_action_pressed("pickUp"):
			animation.play("pick up front")
		elif direction.y == -1 and Input.is_action_pressed("pickUp"):
			animation.play("pick up back")
		elif direction.x == -1 and Input.is_action_pressed("pickUp"):
			animation.play("pick up left")
		elif direction.x == 1 and Input.is_action_pressed("pickUp"):
			animation.play("pick up right")
		
		if pickUp_ip == true and timer == true:
			timer = false
			$pickUp_ip.start()
	
	if Global.pickUpZone == true and Global.pickUp == false:
		$Interact/Label2.visible = true
		$Interact/PickUpPanel.visible = true
	else:
		$Interact/Label2.visible = false
		$Interact/PickUpPanel.visible = false


func idle_animation():
	if idle == true:
		if direction.y == 1:
			animation.play("idle front")
		elif direction.y == -1:
			animation.play("idle back")
		elif direction.x == -1:
			animation.play("idle left")
		elif direction.x == 1:
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
	
	if Global.objektiv_gaaIndPaaHospitalet == true:
		$Interact/TagBussen.visible = false
		$Interact/gaaIndPaaHospitalet.visible = true
	
	if Global.objektiv_snakMedReceptionisten == true:
		$Interact/gaaIndPaaHospitalet.visible = false
		$Interact/snakMedReceptionisten.visible = true
	
	if Global.objektiv_tagElevatoren == true:
		$Interact/snakMedReceptionisten.visible = false
		$Interact/tagElevatoren.visible = true
	
	if Global.objektiv_snakMedDoktor == true:
		$Interact/tagElevatoren.visible = false
		$Interact/snakMedDoktor.visible = true

func BusTur():
	if Global.busTurOver == true and Global.objektiv_gaaIndPaaHospitalet == false:
		position = HospitalBus
		$SpriteSheet.visible = true
		Global.objektiv_gaaIndPaaHospitalet = true
		$Camera2D.current = true
	elif Global.busTurOver == false and Global.objektiv_gaaIndPaaHospitalet == false and Global.iGangMedAtTageBussen == true:
		$SpriteSheet.visible = false

func Hospital_Elevator():
	if Global.DokterEtage == true:
		position = Elevator1
		Global.DokterEtage = false
