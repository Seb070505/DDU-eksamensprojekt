extends KinematicBody2D

onready var animation = $AnimationPlayer


func _ready():
	$Area2D/CollisionShape2D.disabled = true
	$Datter.visible = false
	$Panel.visible = false
	$Label.visible = false

func _physics_process(delta):
	if Global.snakketMedBrandmand == true:
		$Area2D/CollisionShape2D.disabled = false
		$Datter.visible = true
		if Global.interact == true:
			$Panel.visible = true
			$Label.visible = true
			animation.play("idle")
			
		else:
			$Panel.visible = false
			$Label.visible = false

func _on_Area2D_body_entered(body):
	if body.has_method("player") and Global.snakketMedBrandmand == true:
		Global.interactZone = true


func _on_Area2D_body_exited(body):
	Global.interactZone = false
	Global.interact = false
