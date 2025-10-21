extends Node

var balance = 100

var red = {"count": 0, "rarity": "common"}
var yellow = {"count": 0, "rarity": "common"}
var green = {"count": 0, "rarity": "common"}
var blue = {"count": 0, "rarity": "common"}
var purple = {"count": 0, "rarity": "common"}
var sunset = {"count": 0, "rarity": "rare"}
var sherbet = {"count": 0, "rarity": "rare"}

var selected_rock : Texture = null
var selected_path : NodePath = NodePath("")
var shelf_rocks := {"shelf1": null,
					"shelf2": null,
					"shelf3": null}

var current_shelf = ""
