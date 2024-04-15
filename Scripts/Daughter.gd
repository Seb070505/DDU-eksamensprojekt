extends KinematicBody2D



func _physics_process(delta):
	if Global.interact == true and Global.interactMedDatterMulig == true:
		$Panel.visible = true
		$Label.visible = true
	else:
		$Panel.visible = false
		$Label.visible = false


func _on_InteractionZone_Daughter_body_entered(body):
	if body.has_method("player"):
		Global.interactZone = true


func _on_InteractionZone_Daughter_body_exited(body):
	Global.interactZone = false
	Global.interact = false
