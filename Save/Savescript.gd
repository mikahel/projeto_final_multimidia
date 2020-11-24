extends Node

var score_list = []

func _ready():
	load_score_list()
	
func _exit_tree():
	save_score_list()
	
class MyCustomSorter:
	static func sort_ascending(a, b):
		if int(a["player_score"]) < int(b["player_score"]):
			return true
		return false
		
	static func sort_descending(a, b):
		if int(a["player_score"]) > int(b["player_score"]):
			return true
		return false

func save(player_name,player_score):
	var score_dict = {
		"player_name":player_name,
		"player_score":player_score
	}
	
	score_list.append(score_dict)
	score_list.sort_custom(MyCustomSorter, "sort_descending")
	if score_list.size() > 5:
		score_list.pop_back()

func load_score_list():
	var save_file = File.new()
	if not save_file.file_exists("res://Save/savefile.save"):
		return

	save_file.open("res://Save/savefile.save", File.READ)
	score_list = parse_json(save_file.get_line())
	score_list.sort_custom(MyCustomSorter, "sort_descending")
	save_file.close()

func save_score_list():
	var save_file = File.new()
	save_file.open("res://Save/savefile.save", File.WRITE)
	save_file.store_line(to_json(score_list))
	save_file.close()
