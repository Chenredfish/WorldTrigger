extends Attack
class_name NormalAttack

func  _init(attack_site:Vector2i, power:int = 25, power_times:int = 1):
	super()
	self.power = power
	self.power = power_times
	self.attack_site = attack_site

	behavior_amount = 1
