extends Node2D



func _on_Area2D_body_entered(body):
	if body.has_method("player"):
		get_tree().change_scene("res://Scenes/MainGame.tscn")
		Global.brandStation = true
		Global.objektiv_snakMedBrandmand = true
