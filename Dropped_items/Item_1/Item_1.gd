extends Sprite

func _process(delta):
	global_position.x -= 50 * delta
	
	if global_position.x < -20:
		queue_free()
