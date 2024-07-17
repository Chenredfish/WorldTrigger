extends BaseState
class_name s_Playing_Fight

var is_end_game:bool = false
var is_end_behavior:bool = false

func enter(_msg:Dictionary = {}):
	print("s_Playing_Ready")
	

func update(delta):
	if agent.current_map.actor.get_behaviors_size() <=0:
		if agent.current_map.actor.get_current_health() <=0:
			is_end_game = true
		else:
			is_end_behavior = true
	else:
		actor_take_behavior()
		actor_remove_behavior()
		await agent.get_tree().create_timer(3).timeout
	
	
	
	if state_machine.has_value('is_end_game'): #更新狀態
		is_end_game = state_machine.get_value('is_end_game')

	if is_end_game:
		transform_to(StateEnum.GAME_STATE_TYPE.PLAYING_READY)
	
	if state_machine.has_value('is_end_behavior'): #更新狀態
		is_end_behavior = state_machine.get_value('is_end_behavior')

	if is_end_behavior:
		transform_to(StateEnum.GAME_STATE_TYPE.PLAYING_RESULT)
	
	
func actor_take_behavior():
	agent.current_map.actor_take_behavior()
	
func actor_remove_behavior():
	agent.current_map.actor_remove_behavior()
	
func enemy_take_behavior():
	pass

func enemy_remoove_behavior():
	pass
