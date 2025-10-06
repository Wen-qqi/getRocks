extends Node

@onready var buyButton = $Menu/Buy as Button
@onready var archiveButton = $Menu/Archive as Button
@onready var testButton = $Menu/TestingButton as Button

func _ready():
	handle_connecting_signals()
	
func onBuyPressed() -> void:
	get_tree().change_scene_to_file("res://buy_page.tscn")
	
func onArchivePressed() -> void:
	get_tree().change_scene_to_file("res://collection.tscn")
	
func onTestPressed() -> void:
	var rand = str(randi() % 10) # gets a number from 0-9
	testButton.set_text(rand)
	

	
func handle_connecting_signals():
	buyButton.button_down.connect(onBuyPressed)
	archiveButton.button_down.connect(onArchivePressed)
	testButton.button_down.connect(onTestPressed)
	
