extends GridContainer

var return_button = preload("res://UI/Gameover_screen/Margin_button.tscn")
var new_record = preload("res://UI/Gameover_screen/New_record_group.tscn")

func _ready():
	var return_button_instance = return_button.instance()
	var new_record_instance = new_record.instance()
	
	if Savescript.score_list.size() <= 4:
		add_child(new_record_instance)
	else:
		for s in Savescript.score_list:
			if Global.score > int(s["player_score"]):
				add_child(new_record_instance)
				return
		add_child(return_button_instance)
