extends Node

@onready var buyButton = $Menu/BuyFrame/Buy as Button
@onready var archiveButton = $Menu/CollectionFrame/Collection as Button
@onready var testButton = $TestingButton as Button

func _ready():
	handle_connecting_signals()
	
func onBuyPressed() -> void:
	get_tree().change_scene_to_file("res://buy_page.tscn")
	
func onCollectionPressed() -> void:
	get_tree().change_scene_to_file("res://collection_page.tscn")
	
func onTestPressed() -> void:
	var rand = str(randi() % 10) # gets a number from 0-9
	testButton.set_text(rand)
	

	
func handle_connecting_signals():
	buyButton.button_down.connect(onBuyPressed)
	archiveButton.button_down.connect(onCollectionPressed)
	testButton.button_down.connect(onTestPressed)
	
