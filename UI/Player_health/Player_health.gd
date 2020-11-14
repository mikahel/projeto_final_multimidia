extends Sprite

func _process(delta):
	if Global.player != null:
		frame = Global.player.health
