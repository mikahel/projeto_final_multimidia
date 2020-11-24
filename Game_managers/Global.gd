extends Node

var world = null
var player = null
var sound_controller = null

var score = 0
var bomb_count = 10

func play_sound(sound):
	if sound_controller != null:
		if sound_controller.has_node(sound):
			sound_controller.get_node(sound).play()
