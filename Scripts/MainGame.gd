extends Node2D

var rigtigMusik = true
var forkertMusik = false
var idkMan = true


func _physics_process(delta):
	if Global.objektiv_besoegSlagteren == true:
		forkertMusik = true
	if Global.objektiv_snakMedBrandmand == true:
		forkertMusik = true
		
	if Global.objektiv_tagBussen == true and rigtigMusik == true and forkertMusik == false:
		$AudioStreamPlayer.play()
		rigtigMusik = false
	elif Global.objektiv_tagBussen == true and forkertMusik == true and idkMan == true:
		$AudioStreamPlayer2.play()
		$AudioStreamPlayer.stop()
		idkMan = false




func _on_Hospital_indgang_body_entered(body):
	if body.has_method("player") and Global.objektiv_gaaIndPaaHospitalet == true:
		get_tree().change_scene("res://Scenes/Hospital.tscn")
		Global.interactMedReceptionistMulig = true
		Global.objektiv_snakMedReceptionisten = true


func _on_Slagter_body_entered(body):
	if body.has_method("player") and Global.objektiv_besoegSlagteren == true:
		get_tree().change_scene("res://Scenes/Forkert sted.tscn")
		Global.objektiv_snakMedSlagteren = true
		print("Plsssssss")
