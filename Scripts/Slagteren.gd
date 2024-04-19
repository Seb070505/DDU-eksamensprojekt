extends KinematicBody2D

onready var animation = $AnimationPlayer


func _physics_process(delta):
	if Global.interact == true:
		$Panel.visible = true
		$Label.visible = true
		Global.chickenSynelig = true
		Global.objektiv_tagKylling = true
	else:
		$Panel.visible = false
		$Label.visible = false


func _on_Area2D_body_entered(body):
	if body.has_method("player") and Global.chickenSynelig == false:
		Global.interactZone = true


func _on_Area2D_body_exited(body):
	Global.interactZone = false
	Global.interact = false
	
