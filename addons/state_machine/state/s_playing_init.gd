extends BaseState
class_name s_Playing_Init

func enter(_msg:Dictionary = {}):
		agent.ui_layer.show_ready_fight_form()
		agent.load_map()
		print("s_Playing_Init")
