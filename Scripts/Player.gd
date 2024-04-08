extends KinematicBody2D


var speed = 400

var score = 0

func _physics_process(delta):
	var velocity = Vector2.ZERO * delta
	
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	
	elif Input.is_action_pressed("move_down"):
		velocity.y += 1
	
	elif Input.is_action_pressed("move_left"):
		velocity.x -= 1
	
	elif Input.is_action_pressed("move_right"):
		velocity.x += 1
	
	
	velocity = velocity.normalized()
	move_and_slide(velocity * speed)


func player():
	pass


func collected_music(value):
	score += value
