extends Control

@onready var exit_button = $ExitCollection as Button
@onready var purpleRock_button = $MarginContainer/PanelContainer/MarginContainer/GridContainer/PurpleRock/Button as Button
@onready var blueRock_button = $MarginContainer/PanelContainer/MarginContainer/GridContainer/BlueRock/Button as Button
@onready var redRock_button = $MarginContainer/PanelContainer/MarginContainer/GridContainer/RedRock/Button as Button
@onready var yellowRock_button = $MarginContainer/PanelContainer/MarginContainer/GridContainer/YellowRock/Button as Button
@onready var greenRock_button = $MarginContainer/PanelContainer/MarginContainer/GridContainer/GreenRock/Button as Button
const purple_rock = preload("res://art/purpleGemStone.png")
const red_rock = preload("res://art/redGemStone.png")
const yellow_rock = preload("res://art/yellowGemStone.png")
const green_rock = preload("res://art/GreenGemStone.png")
const blue_rock = preload("res://art/blueGemStone4.png")

func _ready():
	exit_button.button_down.connect(on_exit_pressed)
	purpleRock_button.button_down.connect(_on_purpleRock_pressed)
	blueRock_button.button_down.connect(_on_blueRock_button_pressed)
	redRock_button.button_down.connect(_on_redRock_button_down)
	yellowRock_button.button_down.connect(_on_yellowRock_button_pressed)
	greenRock_button.button_down.connect(_on_greenRock_button_pressed)
	set_process(false)

	
func on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
	set_process(false)

func _on_purpleRock_pressed() -> void:
	assign_rock(purple_rock)
	#get_tree().change_scene_to_file("res://main.tscn")

func _on_redRock_button_down() -> void:
	assign_rock(red_rock)
	#get_tree().change_scene_to_file("res://main.tscn")

func _on_yellowRock_button_pressed() -> void:
	assign_rock(yellow_rock)
	#get_tree().change_scene_to_file("res://main.tscn")

func _on_greenRock_button_pressed() -> void:
	assign_rock(green_rock)
	#get_tree().change_scene_to_file("res://main.tscn")
	
func _on_blueRock_button_pressed() -> void:
	assign_rock(blue_rock)
	#get_tree().change_scene_to_file("res://main.tscn")

func assign_rock(rock_texture: Texture) -> void:
	if Global.current_shelf != "":
		Global.shelf_rocks[Global.current_shelf] = rock_texture
	get_tree().change_scene_to_file("res://main.tscn")
	
