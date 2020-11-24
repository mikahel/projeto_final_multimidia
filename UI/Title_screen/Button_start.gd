extends Button

func _on_Button_start_pressed():
	var sound_list = preload("res://Sounds/Bg_music.tscn").instance()
	get_tree().get_root().add_child(sound_list)
	Sound.bg_music_MainMenu = get_tree().get_root().get_node("Bg_music/MainMenu")
	Sound.bg_music_World = get_tree().get_root().get_node("Bg_music/WorldBg")
	Sound.bg_music_GameOver = get_tree().get_root().get_node("Bg_music/GameOver")
	get_tree().change_scene("res://UI/Menu_screen/Menu_screen.tscn")
	
	
