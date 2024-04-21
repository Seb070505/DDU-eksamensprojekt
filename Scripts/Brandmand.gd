extends KinematicBody2D

onready var animation = $AnimationPlayer

func _physics_process(delta):
	if Global.interact == true and Global.objektiv_snakMedBrandmand == true and Global.snakketMedDatter2 == false:
		$Panel.visible = true
		$Label.visible = true
		Global.snakketMedBrandmand = true
		Global.objektiv_snakMedDatter2 = true
		animation.play("idle")
	else:
		$Panel.visible = false
		$Label.visible = false


func _on_Area2D_body_entered(body):
	if body.has_method("player") and Global.brandStation == true:
		Global.interactZone = true


func _on_Area2D_body_exited(body):
	Global.interactZone = false
	Global.interact = false
	
