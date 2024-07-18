extends BaseState
class_name s_Playing_Init



func enter(_msg:Dictionary = {}):
	agent.ui_layer.start_main_form()
	agent.ui_layer.add_move_reflection.connect(map_add_move_reflection)
	agent.load_map()
	
	print("s_Playing_Init")
		
func update(delta:float):
	transform_to(StateEnum.GAME_STATE_TYPE.PLAYING_READY)
		
		
func exit():
	pass

func map_add_move_reflection(site:Vector2i):
	agent.current_map.add_move_reflection(site)
