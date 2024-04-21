extends Node2D




func _on_Area2D_body_entered(body):
	if body.has_method("player") and Global.snakketMedDatter == true:
		get_tree().change_scene("res://Scenes/Distorted verden.tscn")
		Global.underligVerden = true
		Global.objektiv_gaaIndModByen = true
