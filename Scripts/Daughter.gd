extends KinematicBody2D

onready var animation = $AnimationPlayer

var snakkeMedDatter =  false

func _physics_process(delta):
	if Global.interact == true and Global.interactMedDatterMulig == true and snakkeMedDatter == true:
		$Panel.visible = true
		$Label.visible = true
		Global.mulighedForAtTageBussen = true
		animation.play("Daughter idle")
		Global.objektiv_tagBussen = true
	else:
		$Panel.visible = false
		$Label.visible = false


func _on_InteractionZone_Daughter_body_entered(body):
	if body.has_method("player") and Global.interactMedDatterMulig == true:
		Global.interactZone = true
		snakkeMedDatter = true


func _on_InteractionZone_Daughter_body_exited(body):
	Global.interactZone = false
	Global.interact = false
	snakkeMedDatter = false
