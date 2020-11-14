extends CPUParticles2D

func _on_Timer_timeout():
	get_tree().reload_current_scene()
