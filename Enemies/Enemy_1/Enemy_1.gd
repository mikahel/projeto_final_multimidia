extends Sprite

export(int) var health = 1
export(int) var speed = 50
export(int) var point_value = 5

var particles = preload("res://Particles/Enemy_destroy_particles.tscn")
var item_1 = preload("res://Dropped_items/Item_1/Item_1.tscn")
var item_2 = preload("res://Dropped_items/Item_2/Item_2.tscn")

signal instance_node(node, location)

func _ready():
	if Global.world != null:
		connect("instance_node", Global.world, "instance_node")

func _process(delta):
	global_position.x -= speed * delta
	
	if global_position.x < -20:
		queue_free()
		
	if health <= 0:
		Global.play_sound("Explosion")
		Global.score += point_value
		randomize()
		var item_drop = round(rand_range(1, 1000))
		if item_drop >= 1 and item_drop < 50: 
			emit_signal("instance_node", item_1, global_position)
		elif item_drop >= 50 and item_drop < 150:
			emit_signal("instance_node", item_2, global_position)
		emit_signal("instance_node", particles, global_position)
		queue_free()

func _on_Hitbox_area_entered(area):
	if area.is_in_group("Enemy_damager"):
		if health > 1:
			Global.play_sound("Hit")
		health -= area.get_parent().damage
		area.get_parent().queue_free()
		
