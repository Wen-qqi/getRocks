extends Control

func on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
	set_process(false)

@onready var craft_buttons = $MarginLeft/PanelContainer/CraftButtons
@onready var icons_container = $MarginRight/VBoxContainer/IconsContainer

var PanelScene := preload("res://frame.tscn")

func _ready():
	# Connect every button
	for b in craft_buttons.get_children():
		b.pressed.connect(_on_craft_button_pressed.bind(b))


func _on_craft_button_pressed(button: Button):
	var item_id = button.name
	show_recipe(item_id)


func show_recipe(item_id: String):
	# Clear old UI
	for n in icons_container.get_children():
		icons_container.remove_child(n)
		n.queue_free()

	for material in Recipes[item_id]:
		var amount_needed = Recipes[item_id][material]	
		var amount_have = Global[material]["count"]

		var vbox = VBoxContainer.new()
		var panel = $FrameContainer/Frame.duplicate()

		# --- ICON ---
		var icon = TextureRect.new()
		icon.texture = load(Global[material]["image"]) # example path
		icon.stretch_mode = TextureRect.STRETCH_SCALE
		icon.expand_mode = TextureRect.EXPAND_FIT_WIDTH
		panel.add_child(icon)
		vbox.add_child(panel)

		# --- AMOUNT TEXT ---
		var label = Label.new()
		label.add_theme_font_size_override("font_size", 100)
		label.text = "%d / %d" % [amount_have, amount_needed]
		if amount_have < amount_needed:
			label.add_theme_color_override("font_color", Color.RED)
		vbox.add_child(label)
		
		icons_container.add_child(vbox)
