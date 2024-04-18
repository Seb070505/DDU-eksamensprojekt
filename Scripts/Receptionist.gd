extends Area2D

onready var animation = $AnimationPlayer
var snakkeMedReceptionist = false


func _physics_process(delta):
	if Global.interact == true and snakkeMedReceptionist == true:
		$Panel.visible = true
		$Label.visible = true
		animation.play("receptionist_idle")
		Global.mulighedForAtTageElevatoren = true
		Global.objektiv_tagElevatoren = true
	else:
		$Panel.visible = false
		$Label.visible = false


func _on_Receptionist_body_entered(body):
	if body.has_method("player") and Global.interactMedReceptionistMulig == true:
		Global.interactZone = true
		snakkeMedReceptionist = true


func _on_Receptionist_body_exited(body):
	Global.interact = false
	Global.interactZone = false
	snakkeMedReceptionist = false
