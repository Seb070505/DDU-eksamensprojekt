extends KinematicBody2D

onready var animation = $AnimationPlayer

var player = null
var speed = 40
var motion = Vector2.ZERO
var stop_motion = false

func _physics_process(delta):
	motion = Vector2.ZERO
	
	if player:
		if stop_motion == false:
			motion = position.direction_to(player.position) * speed
	
	motion = move_and_slide(motion)
	
	if motion.x == 0 and motion.y == 0:
		animation.play("idle")
	
	if motion.x > 0:
		animation.play("walking_right")
	
	if motion.x < 0:
		animation.play("walking_left")


func _on_Area2D_body_entered(body):
	if body.has_method("player"):
		player = body


func _on_Area2D_body_exited(body):
	player = null


func _on_Area2D2_body_entered(body):
	if body.has_method("player"):
		stop_motion = true


func _on_Area2D2_body_exited(body):
	if body.has_method("player"):
		stop_motion = false
