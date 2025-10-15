extends Node

var rarities = {"Red" : 10,
				"Yellow" : 10,
				"Green" : 10,
				"Blue" : 10,
				"Purple" : 10}

var rng = RandomNumberGenerator.new()

func _ready():
	print(get_rarity())

func get_rarity():
	rng.randomize()

	var weighted_sum = 0

	for n in rarities:
		weighted_sum += rarities[n]
		
	var item = rng.randi_range(0, weighted_sum)
	
	for n in rarities:
		if item <= rarities[n]:
			return n
		item -= rarities[n]
