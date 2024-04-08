extends Area2D


export var speed : int = 200 
export var firstmoveDist : int = 100

onready var startX : float = position.x
onready var firsttargetX : float = position.x + firstmoveDist

func _physics_process(delta):
	position.x = move_to(position.x, firsttargetX, speed * delta)
	if position.x == firsttargetX:
		if firsttargetX == startX:
			firsttargetX = position.x + firstmoveDist
		else:
			firsttargetX = startX
	
	

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
