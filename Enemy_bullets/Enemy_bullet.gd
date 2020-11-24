extends Sprite

export(int) var bullet_speed = 110
export(int) var damage = 1

func _process(delta):
	global_position.x -= bullet_speed * delta
	
	if global_position.x > 180:
		queue_free()
