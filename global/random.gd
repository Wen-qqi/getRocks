extends Node

var common = {"red" : 1, "yellow" : 1, "green" : 1, "blue" : 1, "purple" : 1}
var rare = {"sunset" : 1, "sherbet" : 1}

var rarities_ii = {"common" : 8, "rare" : 2}

var rng = RandomNumberGenerator.new()

func get_random(rarity):
	rng.randomize()

	var weighted_sum = 0

	for n in rarity:
		weighted_sum += rarity[n]
		
	var item = rng.randi_range(0, weighted_sum)
	
	for n in rarity:
		if item <= rarity[n]:
			return n
		item -= rarity[n]
