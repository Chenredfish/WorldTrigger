extends BaseState
class_name s_Playing_Init



func enter(_msg:Dictionary = {}):
	agent.ui_layer.start_main_form()
	
	agent.load_map()
	
	print("s_Playing_Init")
		
func update(delta:float):
	transform_to(StateEnum.GAME_STATE_TYPE.PLAYING_READY)
		
		
func exit():
	pass


