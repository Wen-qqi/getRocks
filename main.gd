extends Node

@onready var exitMenuButton = $OpenExitMenu as Button
@onready var buyButton = $Menu/BuyFrame/Buy as Button
@onready var collectionButton = $Menu/CollectionFrame/Collection as Button
@onready var testButton = $TestingButton as Button

func _ready():
	handle_connecting_signals()
	
func onExitMenuPressed() -> void:
	get_tree().change_scene_to_file("res://exit_menu.tscn")
	
func onBuyPressed() -> void:
	get_tree().change_scene_to_file("res://buy_page.tscn")
	
func onCollectionPressed() -> void:
	get_tree().change_scene_to_file("res://collection_page.tscn")
	
func onTestPressed() -> void:
	var rand = str(randi() % 10) # gets a number from 0-9
	testButton.set_text(rand)
	
func handle_connecting_signals():
	exitMenuButton.button_down.connect(onExitMenuPressed)
	buyButton.button_down.connect(onBuyPressed)
	collectionButton.button_down.connect(onCollectionPressed)
	testButton.button_down.connect(onTestPressed)
	

func _on_shelfbutton1_pressed() -> void:
	pass # Replace with function body.
