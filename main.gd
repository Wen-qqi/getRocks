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
	if Global.selected_rock != null and Global.selected_path != NodePath(""):
		var node_to_update = get_node(Global.selected_path)
		if node_to_update and node_to_update is TextureRect:
			node_to_update.texture = Global.selected_rock
		else:
			print("Warning: selected_path does not point to a TextureRect!")

		Global.selected_rock = null
		Global.selected_path = NodePath("")
	
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
	Global.selected_path = $Shelf1/Button/TextureRect.get_path()
	get_tree().change_scene_to_file("res://display_page.tscn")

func shelfbutton2Pressed() -> void:
	Global.selected_path = $Shelf2/Button/TextureRect.get_path()
	get_tree().change_scene_to_file("res://display_page.tscn")
	

func handle_connecting_signals():
	exitMenuButton.button_down.connect(onExitMenuPressed)
	buyButton.button_down.connect(onBuyPressed)
	collectionButton.button_down.connect(onCollectionPressed)
	testButton.button_down.connect(onTestPressed)
	#shelf1.pressed.connect(_on_shelfbutton1_pressed)
	
func _on_shelfButton3_pressed() -> void:
	Global.selected_path = $Shelf3/Button/TextureRect.get_path()
	get_tree().change_scene_to_file("res://display_page.tscn")
