extends Actor
class_name Sandbag

func _init():
	attack_amount = 20
	max_behavior_amount = 7
	max_health = 3000
	avoid = 5
	trigger1 = TestTrigger.new()
	
	super()
