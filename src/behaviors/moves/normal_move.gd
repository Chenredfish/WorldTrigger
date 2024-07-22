extends BaseMove
class_name NormalMove

func _init(site:Vector2i):
	super()
	self.aim_site = site
	behavior_amount = 1
