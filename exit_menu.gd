extends Control

@onready var return_button = $VBoxContainer/PanelContainer2/ReturnToGame as Button
@onready var exit_game_button = $VBoxContainer/PanelContainer/ExitGame as Button

func _ready():
	return_button.button_down.connect(on_return_pressed)
	exit_game_button.button_down.connect(on_exit_game_pressed)
	set_process(false)
	
func on_return_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
	set_process(false)
	
func on_exit_game_pressed() -> void:
	get_tree().quit()
