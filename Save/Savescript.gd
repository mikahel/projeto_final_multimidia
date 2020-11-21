extends Node

var score_list = []

func _ready():
	load_score_list()
	
func _exit_tree():
	save_score_list()
	
class MyCustomSorter:
	static func sort(a, b):
		if a["player_score"] > b["player_score"]:
			return true
		return false

func save(player_name,player_score):
	var score_dict = {
		"player_name":player_name,
		"player_score":player_score
	}
	
	score_list.append(score_dict)
	if score_list.size() > 1:
		score_list.sort_custom(MyCustomSorter, "sort")
		if score_list.size() > 5:
			score_list.pop_back()

func load_score_list():
	var save_file = File.new()
	if not save_file.file_exists("res://Save/savefile.save"):
		return

	save_file.open("res://Save/savefile.save", File.READ)
	score_list = parse_json(save_file.get_line())
	save_file.close()

func save_score_list():
	var save_file = File.new()
	save_file.open("res://Save/savefile.save", File.WRITE)
	save_file.store_line(to_json(score_list))
	save_file.close()
