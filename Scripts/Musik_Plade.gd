extends Node2D

export var value = 1

func _physics_process(delta):
	pass


func _on_Area2D_body_entered(body):
	if body.has_method("player"):
		body.collected_music(value)
		$self_queue.start()




func _on_self_queue_timeout():
	queue_free()
