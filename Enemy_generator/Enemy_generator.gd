extends Position2D

export(int) var enemy_number

export(PackedScene) var enemy_1
export(PackedScene) var enemy_2
export(PackedScene) var enemy_3

signal instance_node(node, location)

func _on_Timer_timeout():
	randomize()
	var enemy_type = round(rand_range(1, enemy_number))
	emit_signal("instance_node", get("enemy_" + String(enemy_type)), Vector2(180, rand_range(10, 85)))
