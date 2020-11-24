extends Node

onready var bg_music_TitleScreen = get_parent().get_node("GameRoot/TitleScreen")
var bg_music_MainMenu
var bg_music_World
var bg_music_GameOver
var mm = false

var game_state setget SetGameState

func _ready():
	SetGameState("NewGame")
	
func SetGameState(new_value):
	game_state = new_value
	ChangeMusic()
	
func ChangeMusic():
	match game_state:
		"NewGame":
			bg_music_TitleScreen._set_playing(true)
		"MainMenu":
			if bg_music_TitleScreen != null:
				bg_music_TitleScreen._set_playing(false)
			if bg_music_GameOver != null:
				bg_music_GameOver._set_playing(false)
			if mm != true:
				bg_music_MainMenu._set_playing(true)
				mm = true
		"World":
			if bg_music_MainMenu != null:
				bg_music_MainMenu._set_playing(false)
			bg_music_World._set_playing(true)
		"GameOver":
			if bg_music_World != null:
				bg_music_World._set_playing(false)
			bg_music_GameOver._set_playing(true)
