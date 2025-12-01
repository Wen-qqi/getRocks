extends Label

func _process(_delta):
	self.text = str(Inventory.earrings_blue["count"])
