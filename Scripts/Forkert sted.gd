extends Node2D



func _on_Area2D_body_entered(body):
	if body.has_method("player") and Global.chicken == 1:
		Global.objektiv_snakMedDatter = true
		print("Pls virk")
		get_tree().change_scene("res://Scenes/CutsceneSlagter.tscn")
