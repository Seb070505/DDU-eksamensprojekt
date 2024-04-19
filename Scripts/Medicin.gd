extends KinematicBody2D


func _ready():
	$Area2D/CollisionShape2D.disabled = true
	$Pills.visible = false
	$CollisionShape2D.disabled = true

func _physics_process(delta):
	
	if Global.medicinSynelig == true:
		$Area2D/CollisionShape2D.disabled = false
		$Pills.visible = true
		$CollisionShape2D.disabled = false
	
	if Global.pickUp == true and Global.medicinSynelig == true:
		Global.medicinTaget = true
		Global.objektiv_tagElevatorenUdAfHospitalet = true
	
	if Global.medicinTaget == true:
		queue_free()
	


func _on_Area2D_body_entered(body):
	if body.has_method("player") and Global.medicinTaget == false:
		Global.pickUpZone = true


func _on_Area2D_body_exited(body):
	Global.pickUp = false
	Global.pickUpZone = false
