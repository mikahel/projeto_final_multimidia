extends Sprite

var bullet = preload("res://Player_bullet/Bullet/Player_bullet.tscn")
var bomb = preload("res://Player_bullet/Bomb/Player_bomb.tscn")
var particles = preload("res://Particles/Player_destroy_particles.tscn")

var can_shoot = true
var can_shoot_bomb = true
var is_invincible = false
var health = 3

signal instance_node(node, location)
signal beam_pressed(beam_node, location)
signal beam_released()

func _ready():
	global_position.y = get_viewport().get_mouse_position().y
	Global.player = self
	Global.score = 0
	Global.bomb_count = 10
	

func _exit_tree():
	Global.player = null

func _process(delta):
	global_position.y = lerp(global_position.y, get_viewport().get_mouse_position().y, 0.2)
	#global_position.x = lerp(global_position.y, get_viewport().get_mouse_position().x, 0.8)
	
	if Input.is_action_pressed("shoot") and can_shoot:
		Global.play_sound("Shoot")
		emit_signal("instance_node", bullet, global_position)
		$Reload_timer.start()
		can_shoot = false
	elif Input.is_action_pressed("shoot_bomb") and can_shoot_bomb and Global.bomb_count > 0:
		Global.bomb_count -= 1
		Global.play_sound("Shoot")
		emit_signal("instance_node", bomb, global_position)
		$Bomb_timer.start()
		can_shoot_bomb = false
	
	if health <= 0:
		Global.play_sound("Explosion")
		emit_signal("instance_node", particles, global_position)
		queue_free()

func _on_Hitbox_area_entered(area):
	if area.is_in_group("Enemy"):
		Global.play_sound("Explosion")
		area.get_parent().emit_signal("instance_node", area.get_parent().particles, area.get_parent().global_position)
		area.get_parent().queue_free()
		if not is_invincible:
			health -= 1
	elif area.is_in_group("Dropped_items"):
		area.get_parent().queue_free()
		var item_name = area.get_parent().get_name()
		if item_name == "Item_1":
			if health < 3:
				health += 1
			else:
				Global.score += 20
		elif item_name == "Item_2":
			Global.score += 10
		elif item_name == "Item_3":
			if Global.bomb_count < 10:
				Global.bomb_count += 1
			else:
				Global.score += 5
		elif item_name == "Item_4":
			if is_invincible:
				Global.score += 50
			else:
				is_invincible = true
				$Invincivility_timer.start()
	elif area.is_in_group("Player_damager"):
		if not is_invincible:
			if health > 1:
				Global.play_sound("Hit")
			health -= area.get_parent().damage
		area.get_parent().queue_free()

func _on_Reload_timer_timeout():
	can_shoot = true
	$Reload_timer.stop()

func _on_Bomb_timer_timeout():
	can_shoot_bomb = true
	$Bomb_timer.stop()

func _on_Invincivility_timer_timeout():
	is_invincible = false
	$Invincivility_timer.stop()
