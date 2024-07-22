extends Node2D
class_name Actor

signal actor_die
signal move_actor(aim_site:Vector2i, moved_actor:Node2D)

@export var attack_amount:int ##攻擊力
@export var max_behavior_amount:int ##行動段數
@export var max_health:int ##最大生命值
@export var avoid:int ##閃避機率(0~100)
@export var trigger1:BaseTrigger
@export var trigger2:BaseTrigger
@export var trigger3:BaseTrigger

var current_trigger:TestTrigger
var current_health:int ##現在血量
var current_behavior_amount:int ##現在的行為數量
var behaviors:Array[BaseBehavior]

func _init():
	current_health = max_health
	current_behavior_amount = 0

func add_behavior(input_behavior:BaseBehavior):
	behaviors.append(input_behavior)
	
func take_behavior():
	var behavior = behaviors[0]
	if behavior.kind["assist"]:
		pass
		
	if behavior.kind["move"]:
		emit_tilemap_move_self(behavior.aim_site)
		
	if behavior.kind["attack"]:
		pass
		
func remove_behavior():
	behaviors.remove_at(0)
	
func remove_top_behavior():
	behaviors.resize(behaviors.size()-1)

func get_behaviors_size():
	return behaviors.size()
	
func get_current_health()->int:
	return current_health

func emit_tilemap_move_self(input_aim_site:Vector2i):
	move_actor.emit(input_aim_site, self)

func take_damage(total_damage:int):
	current_health-=total_damage
	
func die():
	actor_die.emit()
