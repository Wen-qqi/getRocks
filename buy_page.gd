extends Control

@onready var exit_button = $ExitBuy as Button
@onready var buy_i = $MarginBuy/PanelContainer/TabContainer/Rocks/RockListings/Listings/Listing1/HBoxContainer/BuyItem as Button
@onready var buy_ii = $MarginBuy/PanelContainer/TabContainer/Rocks/RockListings/Listings/Listing2/HBoxContainer/BuyItem as Button

func _ready():
	exit_button.button_down.connect(on_exit_pressed)
	buy_i.button_down.connect(on_i_pressed)
	buy_ii.button_down.connect(on_ii_pressed)
	set_process(false)
	
func on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
	set_process(false)

func on_i_pressed() -> void:
	if Global.balance >= 10:
		Global.balance -= 10
		var count = 5
		while count > 0:
			count -= 1
			var rock = Random.get_random(Random.common)
			Global[rock]["count"] += 1

func on_ii_pressed() -> void:
	if Global.balance >= 25:
		Global.balance -= 25
		var count = 5
		while count > 0:
			count -= 1
			var rarity = Random.get_random(Random.rarities_ii)
			var rock = Random.get_random(Random[rarity])
			Global[rock]["count"] += 1
