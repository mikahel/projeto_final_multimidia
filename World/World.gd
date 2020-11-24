extends Node2D

var beam_instance = null

func _ready():
	Global.world = self
	Sound.SetGameState("World")
	Sound.mm = false
	
func _exit_tree():
	Global.world = null
	
func instance_node(node, location):
	var node_instance = node.instance()
	add_child(node_instance)
	node_instance.global_position = location
