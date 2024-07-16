extends MarginContainer


func action_cancel():
	remove_child(self)
	self.queue_free()
