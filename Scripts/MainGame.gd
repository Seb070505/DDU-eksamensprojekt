extends Node2D



func _on_Hospital_indgang_body_entered(body):
	if body.has_method("player") and Global.objektiv_gaaIndPaaHospitalet == true:
		get_tree().change_scene("res://Scenes/Hospital.tscn")
