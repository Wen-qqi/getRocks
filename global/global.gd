extends Node

var balance = 100

var red = {"count": 0, "rarity": "common", "image": "res://art/redGemStone.png"}
var yellow = {"count": 0, "rarity": "common", "image": "res://art/yellowGemStone.png"}
var green = {"count": 0, "rarity": "common", "image": "res://art/GreenGemStone.png"}
var blue = {"count": 0, "rarity": "common", "image": "res://art/blueGemStone4.png"}
var purple = {"count": 0, "rarity": "common", "image": "res://art/purpleGemStone.png"}
var sunset = {"count": 0, "rarity": "rare", "image": "res://art/colorfulGemStone1.png"}
var sherbet = {"count": 0, "rarity": "rare", "image": "res://art/purpleGemStone4.png"}

var selected_rock : Texture = null
var selected_path : NodePath = NodePath("")
var shelf_rocks := {"shelf1": null,
					"shelf2": null,
					"shelf3": null}

var current_shelf = ""
