extends Area2D

onready var animation = $AnimationPlayer

export var speed : int = 200 
export var firstmoveDist : int = 100
export var secondmoveDist : int = 100

var argh = false
var hehe = true



onready var startX : float = position.x
onready var startY : float = position.y
onready var firsttargetX : float = position.x + firstmoveDist
onready var secondtargetY : float = position.y + secondmoveDist

func _physics_process(delta):
	animationerne()
	
	position.x = move_to(position.x, firsttargetX, speed * delta)
	if position.x == firsttargetX:
		argh = true
		position.y = move_to_2(position.y, secondtargetY, speed * delta)
	



func move_to(current, to, step):
	var new = current
	if new < to:
		new += step
		
		if new > to:
			new = to
	else:
		new -= step
		
		if new < to:
			new = to
	return new



func move_to_2(current, to, step):
	var new = current
	
	if new > to: 
		new -= step
		
		if new < to:
			new = to

	return new
	
	

func animationerne():
	if argh == false and hehe == true:
		animation.play("Bus left")
	elif argh == true and hehe == true and position.y >= 375:
		animation.play("Bus turn")
		$animationsTimer.start()




func _on_animationsTimer_timeout():
	hehe = false
	argh = false
	print("false")
