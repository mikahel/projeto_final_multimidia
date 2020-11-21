extends LineEdit

func _on_Player_name_text_entered(player_name):
	Savescript.save(player_name,String(Global.score))
	get_tree().change_scene("res://UI/Score_screen/Score_screen.tscn")
