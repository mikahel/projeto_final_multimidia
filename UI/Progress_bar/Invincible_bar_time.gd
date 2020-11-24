extends Node2D
onready var timer = $Timer
onready var tween = $Tween
onready var pb = $ProgressBar

func _ready():
	timer.start()

func _process(delta):
	#pb.value = 10*timer.time_left
	tween.interpolate_property(pb,"value",pb.value,10*timer.time_left,0.1,Tween.TRANS_SINE,Tween.EASE_IN_OUT)
	tween.start()

func _on_Timer_timeout():
	pass # Replace with function body.
