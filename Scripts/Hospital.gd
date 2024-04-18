extends Node2D


var interactMedElevator1 = false

func _physics_process(delta):
	if Global.interact == true and interactMedElevator1 == true:
		Global.DokterEtage = true
		Global.objektiv_snakMedDoktor = true


func _on_Elevator_body_entered(body):
	if body.has_method("player") and Global.mulighedForAtTageElevatoren == true:
		Global.interactZone = true
		interactMedElevator1 = true


func _on_Elevator_body_exited(body):
	Global.interact = false
	Global.interactZone = false
	Global.mulighedForAtTageElevatoren = false
	interactMedElevator1 = false
	
