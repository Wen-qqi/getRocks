extends Label

func _process(_delta):
	self.text = str(Global.balance)
	
func _on_button_pressed():
	Global.balance += 1
