extends Label

func _process(_delta):
	self.text = str(Inventory.sherbet["count"])
