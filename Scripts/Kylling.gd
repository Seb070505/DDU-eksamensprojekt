extends Area2D


func _physics_process(delta):
	
	if Global.chickenSynelig == true:
		$CollisionShape2D.disabled = false
		$Chimken.visible = true
	else:
		$CollisionShape2D.disabled = true
		$Chimken.visible = false
	
	if Global.pickUp == true and Global.chickenSynelig:
		Global.chicken += 1
		if Global.chicken >= 1:
			Global.chicken = 1
		Global.objektiv_forladButikken = true
		queue_free()


func _on_Kylling_body_entered(body):
	if body.has_method("player") and Global.chickenSynelig == true:
		Global.pickUpZone = true


func _on_Kylling_body_exited(body):
	Global.pickUp = false
	Global.pickUpZone = false
