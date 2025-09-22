extends Node

@onready var buyButton = $Menu/Buy as Button
@onready var designButton = $Menu/Design as Button
@onready var archiveButton = $Menu/Archive as Button

func _ready():
	handle_connecting_signals()
	
func onBuyPressed() -> void:
	get_tree().change_scene_to_file("res://the_web.tscn")
	

	
func handle_connecting_signals():
	buyButton.button_down.connect(onBuyPressed)
	# design
	# archive
	
