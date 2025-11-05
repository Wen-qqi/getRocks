extends Control

@onready var exit_button = $ExitCollection as Button

func _ready():
	exit_button.button_down.connect(on_exit_pressed)
	set_process(false)
	

func on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
	set_process(false)


func assign_rock(rock_texture: Texture, rarity: String) -> void:
	if Global.current_shelf != "":
		Global.shelf_rocks[Global.current_shelf] = {
			"texture": rock_texture,
			"rarity": rarity,
			"state": "displaying"
		}
	get_tree().change_scene_to_file("res://main.tscn")
	Global.start_selling_timer(Global.current_shelf, rarity)

func _on_rock_sold(shelf_name: String) -> void:
	if Global.shelf_rocks.has(shelf_name):
		var shelf_data = Global.shelf_rocks[shelf_name]
		if shelf_data["state"] == "displaying":
			shelf_data["texture"] = load(Global.coin["image"])
			shelf_data["state"] = "sold"
			Global.shelf_rocks[shelf_name] = shelf_data

func _on_yellowButton_pressed() -> void:
	if Global.yellow["count"] > 0:
		Global.yellow["count"] -= 1
		assign_rock(load(Global.yellow["image"]), Global.yellow["rarity"])

func _on_greenButton_pressed() -> void:
	if Global.green["count"] > 0:
		Global.green["count"] -= 1
		assign_rock(load(Global.green["image"]), Global.green["rarity"])

func _on_redButton_pressed() -> void:
	if Global.red["count"] > 0:
		Global.red["count"] -= 1
		assign_rock(load(Global.red["image"]), Global.red["rarity"])

func _on_blueButton_pressed() -> void:
	if Global.blue["count"] > 0:
		Global.blue["count"] -= 1
		assign_rock(load(Global.blue["image"]), Global.blue["rarity"])

func _on_purpleButton_pressed() -> void:
	if Global.purple["count"] > 0:
		Global.purple["count"] -= 1
		assign_rock(load(Global.purple["image"]), Global.purple["rarity"])

func _on_sunsetButton_pressed() -> void:
	if Global.sunset["count"] > 0:
		Global.sunset["count"] -= 1
		assign_rock(load(Global.sunset["image"]), Global.sunset["rarity"])

func _on_sherbetButton_pressed() -> void:
	if Global.sherbet["count"] > 0:
		Global.sherbet["count"] -= 1
		assign_rock(load(Global.sherbet["image"]), Global.sherbet["rarity"])
