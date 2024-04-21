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
var exitedHospital = Vector2(4075,0)
var positionEfterHospital = true
var positionHosSlagteren = false
var fix = true
var positionHus2 = false
var positionUnderigVerden = false
var positionBrandStation = false

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
	$Interact/TagDinMedicin.visible = false
	$Interact/TagElevatorenUd.visible = false
	$Interact/BesoegSlagteren.visible = false
	$Interact/SnakMedSlagteren.visible = false
	$Interact/tagKylling.visible = false
	$Interact/forladSlagteren.visible = false
	$Interact/snakMedDatter2.visible = false
	$Interact/Map.visible = false
	$Interact/TagBussenMap.visible = false
	$Interact/gaaUdAfHuset.visible = false
	$Interact/gaaIndModByen.visible = false
	$Interact/snakMedBrandmand.visible = false
	$Interact/snakMedDatter3.visible = false
	$Interact/Image.visible = false
	$Interact/ImodByenMap.visible = false
	$Interact/DoktorMap.visible = false
	$Interact/ElevatorMap.visible = false
	$Camera2D.current = true



func _physics_process(delta):
	var velocity = Vector2.ZERO * delta
	
	
	interact_and_pickUp()
	objective()
	BusTur()
	Hospital_Elevator()
	Inventory()
	forkertSted()
	Hus2()
	underligVerden()
	brandstation()
	map()
	
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
	
	if Global.medicinTaget == true and positionEfterHospital == true and Global.tilbageUdenforHospital ==  true:
		position = exitedHospital
		positionEfterHospital = false
	
	if fix == true:
		if Global.objektiv_besoegSlagteren == true:
			positionHosSlagteren = true
		if Global.objektiv_snakMedDatter == true:
			positionHus2 = true
		if Global.objektiv_gaaIndModByen == true:
			positionUnderigVerden = true
		if Global.objektiv_snakMedBrandmand == true:
			positionBrandStation = true
		fix = false
	
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
	
	if Global.objektiv_tagDinMedicin == true:
		$Interact/snakMedDoktor.visible = false
		$Interact/TagDinMedicin.visible = true
	
	if Global.objektiv_tagElevatorenUdAfHospitalet == true:
		$Interact/TagDinMedicin.visible = false
		$Interact/TagElevatorenUd.visible = true
	
	if Global.objektiv_besoegSlagteren == true:
		$Interact/TagElevatorenUd.visible = false
		$Interact/BesoegSlagteren.visible = true
	
	if Global.objektiv_snakMedSlagteren == true:
		$Interact/BesoegSlagteren.visible = false
		$Interact/SnakMedSlagteren.visible = true
	
	if Global.objektiv_tagKylling == true:
		$Interact/SnakMedSlagteren.visible = false
		$Interact/tagKylling.visible = true
	
	if Global.objektiv_forladButikken == true:
		$Interact/tagKylling.visible = false
		$Interact/forladSlagteren.visible = true
	
	if Global.objektiv_snakMedDatter == true:
		$Interact/forladSlagteren.visible = false
		$Interact/snakMedDatter2.visible = true
	
	if Global.objektiv_gaaUdAfHuset == true:
		$Interact/snakMedDatter2.visible = false
		$Interact/gaaUdAfHuset.visible = true
	
	if Global.objektiv_gaaIndModByen == true:
		$Interact/gaaUdAfHuset.visible = false
		$Interact/gaaIndModByen.visible = true
	
	if Global.objektiv_snakMedBrandmand == true:
		$Interact/gaaIndModByen.visible = false
		$Interact/snakMedBrandmand.visible = true
	
	if Global.objektiv_snakMedDatter2 == true:
		$Interact/snakMedBrandmand.visible = false
		$Interact/snakMedDatter3.visible = true
	
	
	


func BusTur():
	if Global.busTurOver == true and Global.objektiv_gaaIndPaaHospitalet == false and positionHosSlagteren == false:
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

func Inventory():
	if Input.is_action_pressed("Inventory"):
		$Interact/Inventory.visible = true
		$Interact/InventoryText.visible = true
		$Interact/Panel2.visible = true
		$Interact/Panel3.visible = true
		$Interact/Panel4.visible = true
		$Interact/Panel5.visible = true
		$Interact/Panel6.visible = true
		$Interact/Panel7.visible = true
		if Global.musikplade == 1:
			$Interact/Vinyl.visible = true
		else:
			$Interact/Vinyl.visible = false
		
		if Global.penge == 50:
			$Interact/Dollar.visible = true
		else:
			$Interact/Dollar.visible = false
		
		if Global.medicinTaget == true:
			$Interact/Pills.visible = true
		else:
			$Interact/Pills.visible = false
		
		if Global.chicken == 1:
			$Interact/Chimken.visible = true
		else:
			$Interact/Chimken.visible = false
	else:
		$Interact/Inventory.visible = false
		$Interact/InventoryText.visible = false
		$Interact/Panel2.visible = false
		$Interact/Panel3.visible = false
		$Interact/Panel4.visible = false
		$Interact/Panel5.visible = false
		$Interact/Panel6.visible = false
		$Interact/Panel7.visible = false
		$Interact/Vinyl.visible = false
		$Interact/Pills.visible = false
		$Interact/Dollar.visible = false
		$Interact/Chimken.visible = false

func forkertSted():
	if Global.objektiv_snakMedSlagteren == true and positionHosSlagteren == true:
		position = Vector2(125,140)
		positionHosSlagteren = false

func Hus2():
	if Global.objektiv_snakMedDatter == true and positionHus2 == true:
		position = Vector2(-1712,3140)
		positionHus2 = false
		print("Position er Hus2")

func underligVerden():
	if Global.underligVerden == true and positionUnderigVerden == true:
		position = Vector2(120,200)
		positionUnderigVerden = false

func brandstation():
	if Global.brandStation == true and positionBrandStation == true:
		position = Vector2(3950,-2125)
		positionBrandStation = false

func map():
	if Input.is_action_just_released("Map"):
		$Interact/Map.visible = false
		$Interact/TagBussenMap.visible = false
		$Interact/ElevatorMap.visible = false
		$Interact/ImodByenMap.visible = false
		$Interact/DoktorMap.visible = false
		$Interact/Image.visible = false
	
	if Input.is_action_pressed("Map"):
		if Global.objektiv_tagBussen == true and Global.objektiv_tagElevatoren == false and Global.objektiv_snakMedDoktor == false and Global.objektiv_besoegSlagteren == false and Global.objektiv_gaaIndModByen == false:
			$Interact/Map.visible = true
			$Interact/TagBussenMap.visible = true
			$Interact/ElevatorMap.visible = false
			$Interact/ImodByenMap.visible = false
			$Interact/DoktorMap.visible = false
			$Interact/Image.visible = false
		if Global.objektiv_tagBussen == true and Global.objektiv_tagElevatoren == true and Global.objektiv_snakMedDoktor == false and Global.objektiv_besoegSlagteren == false and Global.objektiv_gaaIndModByen == false:
			$Interact/Map.visible = true
			$Interact/TagBussenMap.visible = false
			$Interact/ElevatorMap.visible = true
			$Interact/ImodByenMap.visible = false
			$Interact/DoktorMap.visible = false
			$Interact/Image.visible = false
		if Global.objektiv_tagBussen == true and Global.objektiv_tagElevatoren == true and Global.objektiv_snakMedDoktor == true and Global.objektiv_besoegSlagteren == false and Global.objektiv_gaaIndModByen == false:
			$Interact/Map.visible = true
			$Interact/TagBussenMap.visible = false
			$Interact/ElevatorMap.visible = false
			$Interact/ImodByenMap.visible = false
			$Interact/DoktorMap.visible = true
			$Interact/Image.visible = false
		if Global.objektiv_tagBussen == true and Global.objektiv_tagElevatoren == true and Global.objektiv_snakMedDoktor == true and Global.objektiv_besoegSlagteren == true and Global.objektiv_gaaIndModByen == false:
			$Interact/Map.visible = true
			$Interact/TagBussenMap.visible = false
			$Interact/ElevatorMap.visible = false
			$Interact/ImodByenMap.visible = false
			$Interact/DoktorMap.visible = false
			$Interact/Image.visible = true
		if Global.objektiv_tagBussen == true and Global.objektiv_tagElevatoren == true and Global.objektiv_snakMedDoktor == true and Global.objektiv_besoegSlagteren == true and Global.objektiv_gaaIndModByen == true:
			$Interact/Map.visible = true
			$Interact/TagBussenMap.visible = false
			$Interact/ElevatorMap.visible = false
			$Interact/ImodByenMap.visible = true
			$Interact/DoktorMap.visible = false
			$Interact/Image.visible = false
