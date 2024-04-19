extends Node2D





func _on_Area2D_body_entered(body):
	if body.has_method("player") and Global.chicken == 1:
		get_tree().change_scene("res://Scenes/CutsceneSlagter.tscn")
