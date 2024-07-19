extends MarginContainer
class_name ShowButtonContainer


func action_cancel():
	remove_child(self)
	self.queue_free()
