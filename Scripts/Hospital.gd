extends Node2D


var interactMedElevator1 = false
var interactMedElevator2 = false

func _physics_process(delta):
	if Global.interact == true and interactMedElevator1 == true:
		Global.DokterEtage = true
		Global.objektiv_snakMedDoktor = true
	
	if Global.interact == true and interactMedElevator2 == true:
		Global.tilbageUdenforHospital = true
		Global.objektiv_besoegSlagteren = true
		get_tree().change_scene("res://Scenes/MainGame.tscn")


func _on_Elevator_body_entered(body):
	if body.has_method("player") and Global.mulighedForAtTageElevatoren == true:
		Global.interactZone = true
		interactMedElevator1 = true


func _on_Elevator_body_exited(body):
	Global.interact = false
	Global.interactZone = false
	Global.mulighedForAtTageElevatoren = false
	interactMedElevator1 = false
	


func _on_Elevator2_body_entered(body):
	if body.has_method("player") and Global.medicinTaget == true:
		Global.interactZone = true
		interactMedElevator2 = true



func _on_Elevator2_body_exited(body):
	Global.interact = false
	Global.interactZone = false
	interactMedElevator2 = false
	
