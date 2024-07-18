extends BaseState
class_name s_Playing_Fight

var is_end_game:bool = false
var is_end_behavior:bool = false

func enter(_msg:Dictionary = {}):
	print("s_Playing_Fight")
	
	

func update(delta):
	if agent.current_map.actor.get_behaviors_size() <=0:
		if agent.current_map.actor.get_current_health() <=0:
			#agent.game_state_machine.set_value('is_end_game', true)
			is_end_game = true
		else:
			#agent.game_state_machine.set_value('is_end_behavior', true)
			is_end_behavior = true
	else:
		actor_take_behavior()
		actor_remove_behavior()
		
	
	await agent.current_map.move_over
	
	#if state_machine.has_value('is_end_game'): #更新狀態
		#is_end_game = state_machine.get_value('is_end_game')

	if is_end_game:
		transform_to(StateEnum.GAME_STATE_TYPE.PLAYING_RESULT)
	
	#if state_machine.has_value('is_end_behavior'): #更新狀態
		#is_end_behavior = state_machine.get_value('is_end_behavior')

	if is_end_behavior:
		transform_to(StateEnum.GAME_STATE_TYPE.PLAYING_READY)
	
func exit():
	is_end_behavior = false
	is_end_game = false


func actor_take_behavior():
	agent.current_map.actor_take_behavior()
	
func actor_remove_behavior():
	agent.current_map.actor_remove_behavior()
	
func enemy_take_behavior():
	pass

func enemy_remoove_behavior():
	pass
