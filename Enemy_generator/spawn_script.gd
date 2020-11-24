extends Node

func spawn(enemy_number):
	randomize()
	var spawn_chance = rand_range(1, 100)
	match(enemy_number):
		3:
			if spawn_chance >= 1 and spawn_chance< 40:
				return 1
			elif spawn_chance >=40 and spawn_chance <70:
				return 2
			else:
				return 3
		4:
			if spawn_chance >= 1 and spawn_chance< 25:
				return 1
			elif spawn_chance >=25 and spawn_chance <55:
				return 2
			elif spawn_chance >=55 and spawn_chance <90:
				return 3
			else:
				return 4
		5:
			if spawn_chance >= 1 and spawn_chance< 20:
				return 1
			elif spawn_chance >=20 and spawn_chance <40:
				return 2
			elif spawn_chance >=40 and spawn_chance <65:
				return 3
			elif spawn_chance >=65 and spawn_chance <90:
				return 5
			else:
				return 4
		6:
			if spawn_chance >= 1 and spawn_chance< 10:
				return 1
			elif spawn_chance >=10 and spawn_chance <20:
				return 2
			elif spawn_chance >=20 and spawn_chance <35:
				return 3
			elif spawn_chance >=35 and spawn_chance <60:
				return 5
			elif spawn_chance >=60 and spawn_chance <90:
				return 6
			else:
				return 4
		7:
			if spawn_chance >= 1 and spawn_chance< 10:
				return 1
			elif spawn_chance >=10 and spawn_chance <20:
				return 2
			elif spawn_chance >=20 and spawn_chance <35:
				return 3
			elif spawn_chance >=35 and spawn_chance <60:
				return 5
			elif spawn_chance >=60 and spawn_chance <85:
				return 6
			elif spawn_chance >=85 and spawn_chance <90:
				return 7
			else:
				return 4
