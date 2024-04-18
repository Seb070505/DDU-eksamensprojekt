extends KinematicBody2D

onready var animation = $AnimationPlayer

var snakMedDoktor = false

func _physics_process(delta):
	if Global.interact == true and snakMedDoktor == true:
		$Panel.visible = true
		$Label.visible = true
		Global.medicinSynelig = true
		Global.objektiv_tagDinMedicin = true
		animation.play("Dokter_idle")
	else:
		$Panel.visible = false
		$Label.visible = false


func _on_Area2D_body_entered(body):
	if body.has_method("player") and Global.objektiv_snakMedDoktor == true and Global.medicinTaget == false:
		Global.interactZone = true
		snakMedDoktor = true


func _on_Area2D_body_exited(body):
	Global.interact = false
	Global.interactZone = false
	snakMedDoktor = false
	
	
