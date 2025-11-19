extends Control

@onready var exit_button = $ExitBuy as Button

func _ready():
	exit_button.button_down.connect(on_exit_pressed)
	set_process(false)
	
func on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
	set_process(false)

func _on_rock_i_pressed() -> void:
	if Global.balance >= 10:
		Global.balance -= 10
		var count = 5
		while count > 0:
			count -= 1
			var rock = Random.get_random(Random.common)
			Global[rock]["count"] += 1

func _on_rock_ii_pressed() -> void:
	if Global.balance >= 25:
		Global.balance -= 25
		var count = 5
		while count > 0:
			count -= 1
			var rarity = Random.get_random(Random.rarities_ii)
			var rock = Random.get_random(Random[rarity])
			Global[rock]["count"] += 1

func _on_silver_pressed() -> void:
	if Global.balance >= 24:
		Global.balance -= 24
		Global.silver["count"] += 3
