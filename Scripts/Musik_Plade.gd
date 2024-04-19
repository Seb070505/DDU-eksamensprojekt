extends Node2D

export var value = 1

func _physics_process(delta):
	if Global.pickUp == true:
		Global.musikplade = 1
		if Global.musikplade >= 1:
			Global.musikplade = 1
			Global.objektiv_pladeAfspiller = true
	if Global.pickUp == true and Global.musikplade == 1:
		queue_free()


func _on_Area2D_body_entered(body):
	if body.has_method("player"):
		Global.pickUpZone = true
		body.collected_music(value)


func _on_Area2D_body_exited(body):
	Global.pickUp = false
	Global.pickUpZone = false
