extends KinematicBody2D

onready var animation = $AnimationPlayer

var player = null

func _physics_process(delta):
	
	pass

func _on_Area2D_body_entered(body):
	if body.has_method("player"):
		player = body


func _on_Area2D_body_exited(body):
	player = null
