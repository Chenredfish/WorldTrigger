extends BaseMove
class_name NormalJump

func _init(aim_site:Vector2i, last_site:Vector2i):
	super()
	self.aim_site = aim_site
	behavior_amount = 1
	for i in range(1, abs(aim_site.y-last_site.y)):
		behavior_amount *=2
