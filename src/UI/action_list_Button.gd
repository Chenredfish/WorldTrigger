extends MarginContainer
class_name ShowButtonContainer

var behavior_amount:int

func _init(input_behavior_amount:int):
	self.behavior_amount = input_behavior_amount

func action_cancel():
	remove_child(self)
	self.queue_free()
