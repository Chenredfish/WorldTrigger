extends Node2D
class_name Actor

signal actor_die
signal move_actor(aim_site:Vector2i, moved_actor:Node2D)
signal jump_actor(aim_site:Vector2i, moved_actor:Node2D)
signal make_damage(damage:int, attack_site:Vector2i)

@export var attack_amount:int ##攻擊力
@export var max_behavior_amount:int ##行動段數
@export var max_health:int ##最大生命值
@export var avoid:int ##閃避機率(0~100)
@export var trigger1:BaseTrigger
@export var trigger2:BaseTrigger
@export var trigger3:BaseTrigger

var current_trigger:TestTrigger
var current_health:int ##現在血量
var current_behaviors_amount:int ##現在的行為數量
var behaviors:Array[BaseBehavior]

func _init():
	current_health = max_health
	current_behaviors_amount = 0

func add_behavior(input_behavior:BaseBehavior):
	
	behaviors.append(input_behavior)
	current_behaviors_amount+=input_behavior.behavior_amount
	#print("current_behaviors_amount:", current_behaviors_amount)
	
func take_behavior():
	var behavior = behaviors[0]
	if behavior.kind["assist"]:
		pass
		
	if behavior.kind["move"]:
		if behavior is NormalMove:
			emit_tilemap_move_self(behavior.aim_site)
		elif behavior is NormalJump:
			emit_tilemap_jump_self(behavior.aim_site)
		
	if behavior.kind["attack"]:
		if behavior is NormalAttack:
			emit_tilemap_make_damage(behavior)
		
func remove_behavior():
	current_behaviors_amount -= behaviors[0].behavior_amount
	behaviors.remove_at(0)
	
func remove_top_behavior():
	current_behaviors_amount -= behaviors[-1].behavior_amount
	behaviors.resize(behaviors.size()-1)

func get_behaviors_size():
	return behaviors.size()
	
func get_current_behaviors_amount():
	return current_behaviors_amount
	
func get_current_health()->int:
	return current_health

func emit_tilemap_move_self(input_aim_site:Vector2i):
	move_actor.emit(input_aim_site, self)
	
func emit_tilemap_jump_self(input_aim_site:Vector2i):
	jump_actor.emit(input_aim_site, self)
	
func emit_tilemap_make_damage(attack_behavior:NormalAttack):
	make_damage.emit(10, attack_behavior.attack_site, self)

func take_damage(total_damage:int):
	current_health-=total_damage
	if current_health == 0:
		self.die()
	
func die():
	actor_die.emit()
	self.queue_free()
