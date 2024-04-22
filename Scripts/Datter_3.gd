extends KinematicBody2D

onready var animation = $AnimationPlayer

var mulighedForAtSnakkeMedDatter = false
var skiftEndscene = false
var TimerOn = false

func _ready():
	$Area2D/CollisionShape2D.disabled = true
	$Datter.visible = false
	$Panel.visible = false
	$Label.visible = false

func _physics_process(delta):
	if Global.snakketMedBrandmand == true:
		$Area2D/CollisionShape2D.disabled = false
		$Datter.visible = true
		if Global.interact == true and mulighedForAtSnakkeMedDatter == true:
			$Panel.visible = true
			$Label.visible = true
			animation.play("idle")
			skiftEndscene = true
			Global.snakketMedDatter2 = true
		else:
			$Panel.visible = false
			$Label.visible = false
	
	if skiftEndscene == true and TimerOn == false:
		$Timer.start()
		TimerOn = true

func _on_Area2D_body_entered(body):
	if body.has_method("player") and Global.snakketMedBrandmand == true:
		Global.interactZone = true
		mulighedForAtSnakkeMedDatter = true
		


func _on_Area2D_body_exited(body):
	Global.interactZone = false
	Global.interact = false
	mulighedForAtSnakkeMedDatter = false


func _on_Timer_timeout():
	Global.spilSlut = true
	get_tree().change_scene("res://Scenes/Endscene.tscn")
