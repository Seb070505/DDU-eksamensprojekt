extends KinematicBody2D



func _on_InteractionZone_Daughter_body_entered(body):
	if body.has_method("player"):
		pass


func _on_InteractionZone_Daughter_body_exited(body):
	pass # Replace with function body.
