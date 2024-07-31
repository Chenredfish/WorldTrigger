extends Node
class_name BaseTrigger

@export var trigger_attack_amount:int
@export var weight_amount:int ##1或2

var behavior_choice:Array[BaseBehavior]=[]

func get_trigger_attack_amount():
	return trigger_attack_amount
