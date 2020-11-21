extends CPUParticles2D

func _on_Timer_timeout():
	#get_tree().reload_current_scene()
	get_tree().change_scene("res://UI/Gameover_screen/Gameover_screen.tscn")
