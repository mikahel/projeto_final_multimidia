extends Button

func _on_Button_start_pressed():
	Global.score = 0
	get_tree().change_scene("res://World/World.tscn")
