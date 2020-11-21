extends GridContainer

var label = preload("res://UI/Score_screen/Score_label.tscn")

func _ready():
	if Savescript.score_list != []:
		for s in Savescript.score_list:
			var label_instance_name = label.instance()
			var label_instance_score = label.instance()
			
			add_child(label_instance_name)
			add_child(label_instance_score)

			label_instance_name.text = s["player_name"]
			label_instance_score.text = s["player_score"]
