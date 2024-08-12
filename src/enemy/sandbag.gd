extends Actor
class_name Sandbag

@onready var damage_number_original_position = $DamageNumberOriginalPosition

func _init():
	attack_amount = 20
	max_behavior_amount = 7
	max_health = 3000
	avoid = 5
	trigger1 = TestTrigger.new()
	
	super()

func take_damage(total_damage:int):
	super(total_damage)

	DamageNumbers.display_number(total_damage, damage_number_original_position.global_position)
