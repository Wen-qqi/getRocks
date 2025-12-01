extends Control

@onready var exit_button = $ExitBuy as Button

func _ready():
	exit_button.button_down.connect(on_exit_pressed)
	set_process(false)
	
func on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
	set_process(false)

func _on_rock_i_pressed() -> void:
	if Inventory.balance >= 10:
		Inventory.balance -= 10
		var count = 5
		while count > 0:
			count -= 1
			var rock = Random.get_random_rock(Random.common)
			Inventory[rock]["count"] += 1

func _on_rock_ii_pressed() -> void:
	if Inventory.balance >= 25:
		Inventory.balance -= 25
		var count = 5
		while count > 0:
			count -= 1
			var rarity = Random.get_random_rock(Random.rarities_ii)
			var rock = Random.get_random_rock(Random[rarity])
			Inventory[rock]["count"] += 1

func _on_silver_pressed() -> void:
	if Inventory.balance >= 24:
		Inventory.balance -= 24
		Inventory.silver["count"] += 3

func _on_gold_pressed() -> void:
	if Inventory.balance >= 30:
		Inventory.balance -= 30
		Inventory.gold["count"] += 3
