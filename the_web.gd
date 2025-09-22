class_name TheWeb
extends Control

@onready var erock_tab = $Browser/TabBar/ERockTab as Button
@onready var rockpro_tab = $Browser/TabBar/RockProTab as Button
@onready var rockbook_tab = $Browser/TabBar/RockBookTab as Button
@onready var exit_button = $ExitBuy as Button

func _ready():
	exit_button.button_down.connect(on_exit_pressed)
	set_process(false)
	
func on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
	set_process(false)
