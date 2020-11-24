extends Position2D

#export(int) var enemy_number

#export(PackedScene) var enemy_1
#export(PackedScene) var enemy_2
#export(PackedScene) var enemy_3

var enemy_number = 3

var enemy_1 = preload("res://Enemies/Enemy_1/Enemy_1.tscn")
var enemy_2 = preload("res://Enemies/Enemy_2/Enemy_2.tscn")
var enemy_3 = preload("res://Enemies/Enemy_3/Enemy_3.tscn")
var enemy_4 = preload("res://Enemies/Enemy_4/Enemy_4.tscn")
var enemy_5 = preload("res://Enemies/Enemy_5/Enemy_5.tscn")
var enemy_6 = preload("res://Enemies/Enemy_6/Enemy_6.tscn")
var enemy_7 = preload("res://Enemies/Enemy_7/Enemy_7.tscn")

signal instance_node(node, location)

func _process(delta):
	#var timer = get_node("Timer")
	if Global.score >= 100 and Global.score < 299:
		enemy_number = 4
		#timer.wait_time = 0.8
	elif Global.score >= 300 and Global.score < 499:
		enemy_number = 5
		#timer.wait_time = 0.6
	elif Global.score >= 500 and Global.score < 699:
		enemy_number = 6
		#timer.wait_time = 0.4
	elif Global.score >= 700:
		enemy_number = 7
		#timer.wait_time = 0.2

func _on_Timer_timeout():
	randomize()
	var enemy_type = round(rand_range(1, 2))
	emit_signal("instance_node", get("enemy_" + String(enemy_type)), Vector2(180,rand_range(30, 70)))
	#var enemy_type = SpawnScript.spawn(enemy_number)
	#if enemy_type != 4:
	#	emit_signal("instance_node", get("enemy_" + String(enemy_type)), Vector2(180, rand_range(10, 70)))
	#else:
	#	emit_signal("instance_node", get("enemy_" + String(enemy_type)), Vector2(180, 80))

func _on_Timer2_timeout():
	emit_signal("instance_node", get("enemy_3"), Vector2(180, rand_range(15, 45)))


func _on_Timer3_timeout():
	if enemy_number >= 4:
		emit_signal("instance_node", get("enemy_4"), Vector2(180, 80))


func _on_Timer4_timeout():
	if enemy_number >= 5:
		emit_signal("instance_node", get("enemy_5"), Vector2(180, rand_range(15, 70)))


func _on_Timer5_timeout():
	if enemy_number >= 6:
		emit_signal("instance_node", get("enemy_6"), Vector2(180, rand_range(15, 70)))


func _on_Timer6_timeout():
	pass # Replace with function body.
