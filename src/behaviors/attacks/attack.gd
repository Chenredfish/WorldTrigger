extends BaseBehavior
class_name Attack

var power:int
var power_times:int
var attack_site:Vector2i

func _init():
	kind["attack"] = true
