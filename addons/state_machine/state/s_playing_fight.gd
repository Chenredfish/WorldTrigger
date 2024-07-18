extends BaseState
class_name s_Playing_Fight

var is_end_game:bool = false
var is_end_behavior:bool = false

func enter(_msg:Dictionary = {}):
	print("s_Playing_Fight")
	while is_end_game==false and is_end_behavior==false:
		if agent.current_map.actor.get_behaviors_size() <=0:
			if agent.current_map.actor.get_current_health() <=0:
				is_end_game = true
				print("game")
			else:
				is_end_behavior = true
				print("beh")
		else:
			actor_take_behavior()
			actor_remove_behavior()
			print("a")
		await agent.current_map.move_over
		print("b")


func update(delta):
	if is_end_game:
		transform_to(StateEnum.GAME_STATE_TYPE.PLAYING_RESULT)
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
