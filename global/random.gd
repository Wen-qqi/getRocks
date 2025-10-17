extends Node

var common = {"Red" : 10,
				"Yellow" : 10,
				"Green" : 10,
				"Blue" : 10,
				"Purple" : 10}

var rng = RandomNumberGenerator.new()

#func _ready():
#	print(get_rarity())

func get_common():
	rng.randomize()

	var weighted_sum = 0

	for n in common:
		weighted_sum += common[n]
		
	var item = rng.randi_range(0, weighted_sum)
	
	for n in common:
		if item <= common[n]:
			return n
		item -= common[n]
