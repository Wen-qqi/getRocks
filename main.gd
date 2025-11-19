extends Node

@onready var exitMenuButton = $OpenExitMenu as Button
@onready var buyButton = $Menu/BuyFrame/Buy as Button
@onready var collectionButton = $Menu/CollectionFrame/Collection as Button

func _ready():
	handle_connecting_signals()
	update_shelf()
	Global.shelf_sold.connect(shelf_sold_update)
	
func onExitMenuPressed() -> void:
	get_tree().change_scene_to_file("res://exit_menu.tscn")
	
func onBuyPressed() -> void:
	get_tree().change_scene_to_file("res://buy_page.tscn")
	
func onCollectionPressed() -> void:
	get_tree().change_scene_to_file("res://collection_page.tscn")

func onCraftPressed() -> void:
	get_tree().change_scene_to_file("res://crafting_page.tscn")

func on_shelf1_button_pressed() -> void:
	handle_shelf_pressed("shelf1")

func shelfbutton2Pressed() -> void:
	handle_shelf_pressed("shelf2")

func handle_connecting_signals():
	exitMenuButton.button_down.connect(onExitMenuPressed)
	buyButton.button_down.connect(onBuyPressed)
	collectionButton.button_down.connect(onCollectionPressed)
	
func _on_shelfButton3_pressed() -> void:
	handle_shelf_pressed("shelf3")
	
func update_shelf():
	# For number 1-3 (shelf1 - shelf3)
	for i in range(1, 11):
		var shelf_name = "shelf%d" % i # Gets the last number of shelf
		var texture_rect_path = "MarginContainer/GridContainer/Shelf%d/Button/TextureRect" % i # Makes a path to the texture depending on the shelf number
		var texture_rect = get_node(texture_rect_path) # # Get the node to the texture path
		
		# Checks if the shelf_name is in shelf_rocks
		if Global.shelf_rocks.has(shelf_name):
			# Gets the current data of the shelf
			var shelf_data = Global.shelf_rocks[shelf_name]
			# Checks if the data of shelf_rocks has "texture"
			if shelf_data != null and typeof(shelf_data) == TYPE_DICTIONARY and shelf_data.has("texture"):
				# Update the texture to the texture in shelf_data
				texture_rect.texture = shelf_data["texture"]
			
			
func collect_coins(shelf_name: String) -> void:
	var data = Global.shelf_rocks[shelf_name] 
	if data != null and data["state"] == "sold": # Checks if it's sold
		var rarity = data["rarity"] 
		var price = Global.get_rarity_price(rarity) # Get the price of the rarity 
		Global.balance += price # Add coin to balance

	# Reset shelf back to plusButton texture
	var plus_texture = load(Global.plusButton["image"]) 
	Global.shelf_rocks[shelf_name] = { 
		"texture": plus_texture, # Adds the texture to the shelf_rocks 
		"state": "empty" # Update the state to empty
	}

	# Update the TextureRect right away
	var shelf_number = int(shelf_name.substr(5)) # Gets the last number of shelf
	var texture_rect_path = "MarginContainer/GridContainer/Shelf%d/Button/TextureRect" % shelf_number # Makes a path to the texture depending on the shelf number
	var texture_rect = get_node(texture_rect_path) # Find the node to the texture path
	if texture_rect and texture_rect is TextureRect: # Checks if the node exists and if the node is actually a TextureRect
		texture_rect.texture = plus_texture # Changes the texture to plus_texture 

	Global.shelf_rocks[shelf_name] = null # Update the shelf to null
	update_shelf() # Update the shelf to the texture

func handle_shelf_pressed(shelf_name: String) -> void:
	var data = Global.shelf_rocks.get(shelf_name)	
	
	# If the shelf is null (empty), it change to the display page
	if data == null: 
		Global.current_shelf = shelf_name 
		get_tree().change_scene_to_file("res://display_page.tscn")
		return
	
	# If the shelf is displaying a rock, then the player would not be able to do anything to it until it gets sold
	if typeof(data) == TYPE_DICTIONARY and data.get("state") == "displaying":
		return
	
	# If the rock is sold and a coin is displayed, the player will be able to collect the coin
	if typeof(data) == TYPE_DICTIONARY and data.get("state") == "sold":
		collect_coins(shelf_name)
		return
		
func shelf_sold_update(shelf_name: String):
	var shelf_number = int(shelf_name.substr(5)) # Gets the last number of shelf
	var texture_rect_path = "MarginContainer/GridContainer/Shelf%d/Button/TextureRect" % shelf_number # Makes a path to the texture depending on the shelf number
	var texture_rect = get_node(texture_rect_path) #  Find the node to the texture path

	if texture_rect and texture_rect is TextureRect: # Checks if the node exists and if the node is actually a TextureRect
		texture_rect.texture = Global.shelf_rocks[shelf_name]["texture"] # Changes the texture to whatever the texture is set to in Global.shelf_rocks
		

func on_shelf4_button_pressed() -> void:
	handle_shelf_pressed("shelf4")
	
func _on_shelf5_button_pressed() -> void:
	handle_shelf_pressed("shelf5")

func _on_shelf6_button_pressed() -> void:
	handle_shelf_pressed("shelf6")

func _on_shelf7_button_pressed() -> void:
	handle_shelf_pressed("shelf7")

func _on_shelf8_button_pressed() -> void:
	handle_shelf_pressed("shelf8")

func _on_shelf9_button_pressed() -> void:
	handle_shelf_pressed("shelf9")

func _on_shelf10_button_pressed() -> void:
	handle_shelf_pressed("shelf10")
