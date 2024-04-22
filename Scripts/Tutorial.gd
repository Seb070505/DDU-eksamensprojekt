extends Node2D

var progress = Global.load_data("res://data.dat")


func _physics_process(delta):
	
	if progress == 0:
		$Save_File_text.visible = false
		$Save_File_text2.visible = false
	elif progress >= 0:
		$Save_File_text.visible = true
		$Save_File_text2.visible = true
		$Save_File_text.text = String(progress)


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Hus1.tscn")
