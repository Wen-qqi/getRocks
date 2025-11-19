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

var silver = {"count": 0, "image": "res://art/silverBar.png"}


var coin = {"common" = 10, "rare" = 20, 'image' = "res://art/coin.png"}


var selected_rock : Texture = null
var selected_path : NodePath = NodePath("")
var shelf_rocks := {"shelf1": null,
					"shelf2": null,
					"shelf3": null,
					"shelf4": null,
					"shelf5": null,
					"shelf6": null,
					"shelf7": null,
					"shelf8": null,
					"shelf9": null,
					"shelf10": null,}

var current_shelf = ""

var plusButton = {'image' = "res://art/plusButton.png"}

func get_rarity_price(rarity: String) -> int: 
	# Checks rarity of the rocks and return the price depending on the rarity
	if rarity == "rare":
		#return coin["rare"]
		return randi_range(18, 25)
	#return coin["common"]
	return randi_range(8, 12)

func start_selling_timer(shelf_name: String, rarity: String) -> void:
	# Starts a timer after a rock has been displayed
	var timer := Timer.new() # Create a timer
	timer.one_shot = true # Timer only runs once and will stop after reaching the end
	# Run a different timer depending on the rarity
	if rarity == "rare": 
		timer.wait_time = randf_range(10.0, 20.0) # 10-20 seconds
	else:
		timer.wait_time = randf_range(5.0, 10.0) # 5-10 second
	add_child(timer) # Add a child node timer
	
	# Links to the signal "timeout" and will call on_rock_sold
	# It will pass shelf_name as an argument to on_rock_sold
	# When the timer runs out, it will call on_rock_sold(shelf_name)
	timer.connect("timeout", Callable(self,"on_rock_sold").bind(shelf_name)) 
	timer.start() # Start timer

func on_rock_sold(shelf_name: String) -> void:
	if shelf_rocks.has(shelf_name): # Checks if shelf_rocks has the name of the shelf that was inputted
		var data = shelf_rocks[shelf_name]
		# If the state of data is displaying and not null(empty), it will display the coin image and set the state to sold
		if data != null and typeof(data) == TYPE_DICTIONARY and data["state"] == "displaying": 
			data["texture"] = load(coin["image"])
			data["state"] = "sold"
			# Update the data for the select shelf
			shelf_rocks[shelf_name] = data
			# Emits signal that the rock is sold for that shelf
			emit_signal("shelf_sold", shelf_name)
