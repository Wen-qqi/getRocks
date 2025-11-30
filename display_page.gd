extends Control

@onready var exit_button = $ExitCollection as Button

func _ready():
	exit_button.button_down.connect(on_exit_pressed)
	set_process(false)

func on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
	set_process(false)


func assign_rock(rock_texture: Texture, rarity: String) -> void:
	# Check if the player actually selected a shelf
	if Global.current_shelf != "":
		# Update the shelf to the rock texture and the state to displaying
		Global.shelf_rocks[Global.current_shelf] = {
			"texture": rock_texture,
			"rarity": rarity,
			"state": "displaying"
		}
	get_tree().change_scene_to_file("res://main.tscn")
	# Start the timer 
	Global.start_selling_timer(Global.current_shelf, rarity)

func _on_rock_sold(shelf_name: String) -> void:
	# Checks if there if the shelf_name is in shelf_rocks
	if Global.shelf_rocks.has(shelf_name):
		var shelf_data = Global.shelf_rocks[shelf_name]
		# If the state is displaying, update the texture to the coin and the state to sold
		if shelf_data["state"] == "displaying":
			shelf_data["texture"] = load(Global.coin["image"])
			shelf_data["state"] = "sold"
			Global.shelf_rocks[shelf_name] = shelf_data

func on_rock_button_pressed(color: String) -> void:
	var data = Global.get(color)
	if data["count"] > 0:
		data["count"] -= 1
		assign_rock(load(data["image"]), data["rarity"])
