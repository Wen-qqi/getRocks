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
	Global.current_shelf = "shelf1"
	get_tree().change_scene_to_file("res://display_page.tscn")

func shelfbutton2Pressed() -> void:
	Global.current_shelf = "shelf2"
	get_tree().change_scene_to_file("res://display_page.tscn")
	

func handle_connecting_signals():
	exitMenuButton.button_down.connect(onExitMenuPressed)
	buyButton.button_down.connect(onBuyPressed)
	collectionButton.button_down.connect(onCollectionPressed)
	testButton.button_down.connect(onTestPressed)
	#shelf1.pressed.connect(_on_shelfbutton1_pressed)
	#shelf2.pressed.connect(shelfbutton2Pressed)
	#shelf3.pressed.connect(_on_shelfButton3_pressed)
	
func _on_shelfButton3_pressed() -> void:
	Global.current_shelf = "shelf3"
	get_tree().change_scene_to_file("res://display_page.tscn")
	
func update_shelf():
	for i in range(1, 4):
		var shelf_name = "shelf%d" % i
		if Global.shelf_rocks.has(shelf_name) and Global.shelf_rocks[shelf_name] != null:
			var texture = Global.shelf_rocks[shelf_name]
			var texture_rect_path = "Shelf%d/Button/TextureRect" % i
			var texture_rect = get_node(texture_rect_path)
			if texture_rect and texture_rect is TextureRect:
				texture_rect.texture = texture
