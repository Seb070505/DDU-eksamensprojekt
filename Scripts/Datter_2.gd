extends KinematicBody2D

onready var animation = $AnimationPlayer

func _physics_process(delta):
	if Global.interact == true:
		$Panel.visible = true
		$Label.visible = true
		Global.chicken = 0
		Global.snakketMedDatter = true
		animation.play("datter_idle")
	else:
		$Panel.visible = false
		$Label.visible = false



func _on_Area2D_body_entered(body):
	if body.has_method("player") and Global.chicken == 1:
		Global.interactZone = true


func _on_Area2D_body_exited(body):
	Global.interact = false
	Global.interactZone = false
