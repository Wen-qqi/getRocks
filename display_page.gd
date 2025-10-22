extends Control

@onready var exit_button = $ExitCollection as Button

func _ready():
	exit_button.button_down.connect(on_exit_pressed)
	set_process(false)
	

func on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
	set_process(false)


func assign_rock(rock_texture: Texture) -> void:
	if Global.current_shelf != "":
		Global.shelf_rocks[Global.current_shelf] = rock_texture
	get_tree().change_scene_to_file("res://main.tscn")
	
func sold() -> void:
	pass

func _on_yellowButton_pressed() -> void:
	if Global.yellow["count"] > 0:
		Global.yellow["count"] -= 1
		assign_rock(load(Global.yellow["image"]))

func _on_greenButton_pressed() -> void:
	if Global.green["count"] > 0:
		Global.green["count"] -= 1
		assign_rock(load(Global.green["image"]))

func _on_redButton_pressed() -> void:
	if Global.red["count"] > 0:
		Global.red["count"] -= 1
		assign_rock(load(Global.red["image"]))

func _on_blueButton_pressed() -> void:
	if Global.blue["count"] > 0:
		Global.blue["count"] -= 1
		assign_rock(load(Global.blue["image"]))

func _on_purpleButton_pressed() -> void:
	if Global.purple["count"] > 0:
		Global.purple["count"] -= 1
		assign_rock(load(Global.purple["image"]))

func _on_sunsetButton_pressed() -> void:
	if Global.sunset["count"] > 0:
		Global.sunset["count"] -= 1
		assign_rock(load(Global.sunset["image"]))

func _on_sherbetButton_pressed() -> void:
	if Global.sherbet["count"] > 0:
		Global.sherbet["count"] -= 1
		assign_rock(load(Global.sherbet["image"]))
