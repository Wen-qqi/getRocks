extends Node

@onready var exitMenuButton = $OpenExitMenu as Button
@onready var buyButton = $Menu/BuyFrame/Buy as Button
@onready var collectionButton = $Menu/CollectionFrame/Collection as Button
@onready var testButton = $TestingButton as Button
@onready var shelf1 = $Shelf1/Button
@onready var shelf2 = $Shelf2/Button
@onready var shelf3 = $Shelf3/Button



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
	
func onTestPressed() -> void:
	var rand = str(randi() % 10) # gets a number from 0-9
	testButton.set_text(rand)

func _on_shelfbutton1_pressed() -> void:
	handle_shelf_pressed("shelf1")


func shelfbutton2Pressed() -> void:
	handle_shelf_pressed("shelf2")


func handle_connecting_signals():
	exitMenuButton.button_down.connect(onExitMenuPressed)
	buyButton.button_down.connect(onBuyPressed)
	collectionButton.button_down.connect(onCollectionPressed)
	testButton.button_down.connect(onTestPressed)
	
func _on_shelfButton3_pressed() -> void:
	handle_shelf_pressed("shelf3")
	
func update_shelf():
	for i in range(1, 4):
		var shelf_name = "shelf%d" % i
		var texture_rect_path = "Shelf%d/Button/TextureRect" % i
		var texture_rect = get_node(texture_rect_path)

		if not texture_rect or not (texture_rect is TextureRect):
			continue

		if Global.shelf_rocks.has(shelf_name):
			var shelf_data = Global.shelf_rocks[shelf_name]
			if shelf_data != null and typeof(shelf_data) == TYPE_DICTIONARY and shelf_data.has("texture"):
				texture_rect.texture = shelf_data["texture"]
			
func collect_coins(shelf_name: String) -> void:
	var data = Global.shelf_rocks[shelf_name]
	if data != null and data["state"] == "sold":
		var rarity = data["rarity"]
		var price = Global.get_rarity_price(rarity)
		Global.balance += price
	
	Global.shelf_rocks[shelf_name] = null
	update_shelf()

func handle_shelf_pressed(shelf_name: String) -> void:
	var data = Global.shelf_rocks.get(shelf_name)	

	if data == null:
		Global.current_shelf = shelf_name
		get_tree().change_scene_to_file("res://display_page.tscn")
	
	if typeof(data) == TYPE_DICTIONARY and data.get("state") == "displaying":
		return
	
	if typeof(data) == TYPE_DICTIONARY and data.get("state") == "sold":
		collect_coins(shelf_name)
		return
		
func shelf_sold_update(shelf_name: String):
	var shelf_number = int(shelf_name.substr(5, shelf_name.length() - 5))  
	var texture_rect_path = "Shelf%d/Button/TextureRect" % shelf_number
	var texture_rect = get_node(texture_rect_path)

	if texture_rect and texture_rect is TextureRect:
		texture_rect.texture = Global.shelf_rocks[shelf_name]["texture"]
