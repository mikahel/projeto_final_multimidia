extends Sprite

var bullet = preload("res://Player_bullet/Player_bullet.tscn")
var particles = preload("res://Particles/Player_destroy_particles.tscn")

var can_shoot = true
var health = 3

signal instance_node(node, location)

func _ready():
	global_position.y = get_viewport().get_mouse_position().y
	Global.score = 0
	Global.player = self

func _exit_tree():
	Global.player = null

func _process(delta):
	global_position.y = lerp(global_position.y, get_viewport().get_mouse_position().y, 0.2)
	
	if Input.is_action_pressed("shoot") and can_shoot:
		Global.play_sound("Shoot")
		emit_signal("instance_node", bullet, global_position)
		$Reload_timer.start()
		can_shoot = false
	
	if health <= 0:
		Global.play_sound("Explosion")
		emit_signal("instance_node", particles, global_position)
		queue_free()

func _on_Hitbox_area_entered(area):
	if area.is_in_group("Enemy"):
		Global.play_sound("Explosion")
		area.get_parent().emit_signal("instance_node", area.get_parent().particles, area.get_parent().global_position)
		area.get_parent().queue_free()
		health -= 1
	elif area.is_in_group("Dropped_items"):
		area.get_parent().queue_free()
		var item_name = area.get_parent().get_name()
		if item_name == "Item_1":
			health += 1
		elif item_name == "Item_2":
			Global.score += 10

func _on_Reload_timer_timeout():
	can_shoot = true
	$Reload_timer.stop()
