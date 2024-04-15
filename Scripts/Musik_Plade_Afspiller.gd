extends Area2D


func _physics_process(delta):
	if Global.interact == true and Global.musikplade == 1:
		$AudioStreamPlayer.play()
		Global.musikplade -= 1
		Global.interactMedDatterMulig = true
		print("musik")
	

func _on_Musik_Plade_Afspiller_body_entered(body):
	if body.has_method("player"):
		Global.interactZone = true


func _on_Musik_Plade_Afspiller_body_exited(body):
	Global.interact = false
	Global.interactZone = false