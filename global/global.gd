extends Node

signal shelf_sold(shelf_name: String)

var balance = 100

var red = {"count": 0, "rarity": "common", "image": "res://art/redGemStone.png"}
var yellow = {"count": 0, "rarity": "common", "image": "res://art/yellowGemStone.png"}
var green = {"count": 0, "rarity": "common", "image": "res://art/GreenGemStone.png"}
var blue = {"count": 0, "rarity": "common", "image": "res://art/blueGemStone4.png"}
var purple = {"count": 0, "rarity": "common", "image": "res://art/purpleGemStone.png"}
var sunset = {"count": 0, "rarity": "rare", "image": "res://art/colorfulGemStone1.png"}
var sherbet = {"count": 0, "rarity": "rare", "image": "res://art/purpleGemStone4.png"}
var coin = {"common" = 10, "rare" = 20, 'image' = "res://art/coin.png"}

var selected_rock : Texture = null
var selected_path : NodePath = NodePath("")
var shelf_rocks := {"shelf1": null,
					"shelf2": null,
					"shelf3": null}

var current_shelf = ""

func get_rarity_price(rarity: String) -> int:
	if rarity == "rare":
		return coin["rare"]
	return coin["common"]

func start_selling_timer(shelf_name: String, rarity: String) -> void:
	var timer := Timer.new()
	timer.one_shot = true
	if rarity == "rare":
		timer.wait_time = randf_range(10.0, 20.0)
	else:
		timer.wait_time = randf_range(5.0, 10.0)
	add_child(timer)
	timer.connect("timeout", Callable(self,"on_rock_sold").bind(shelf_name))
	timer.start()

func on_rock_sold(shelf_name: String) -> void:
	if shelf_rocks.has(shelf_name):
		var data = shelf_rocks[shelf_name]
		if data != null and typeof(data) == TYPE_DICTIONARY and data["state"] == "displaying":
			data["texture"] = load(coin["image"])
			data["state"] = "sold"
			shelf_rocks[shelf_name] = data
			emit_signal("shelf_sold", shelf_name)
