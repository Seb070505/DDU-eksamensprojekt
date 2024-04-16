extends KinematicBody2D

onready var animation = $AnimationPlayer

var musikPlaying = false

func _physics_process(delta):
	if Global.interact == true and Global.musikplade == 1:
		$AudioStreamPlayer.play()
		Global.musikplade -= 1
		Global.interactMedDatterMulig = true
		musikPlaying = true
		print("musik")

	if musikPlaying == true:
		animation.play("musik_playing")
	else:
		animation.play("musik_idle")
	

func _on_Musikplade_Area2D_body_entered(body):
	if body.has_method("player"):
		Global.interactZone = true


func _on_Musikplade_Area2D_body_exited(body):
	Global.interact = false
	Global.interactZone = false
