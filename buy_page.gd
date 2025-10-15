extends Control

@onready var exit_button = $ExitBuy as Button
@onready var buy_common = $MarginBuy/PanelContainer/TabContainer/BuyRock/RockListings/Listings/Listing1/HBoxContainer/BuyItem as Button

func _ready():
	exit_button.button_down.connect(on_exit_pressed)
	buy_common.button_down.connect(on_common_pressed)
	set_process(false)
	
func on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
	set_process(false)

func on_common_pressed() -> void:
	if Global.balance >= 10:
		Global.balance -= 10
		var count = 5
		while count > 0:
			count -= 1
			var rock = Random.get_rarity()
			if rock == "Red":
				Global.redRock += 1
			elif rock == "Yellow":
				Global.yellowRock += 1
			elif rock == "Green":
				Global.greenRock += 1
			elif rock == "Blue":
				Global.blueRock += 1
			elif rock == "Purple":
				Global.purpleRock += 1
