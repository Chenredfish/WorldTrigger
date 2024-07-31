extends BaseState
class_name s_Playing_Init



func enter(_msg:Dictionary = {}):
	agent.ui_layer.start_main_form()
	agent.ui_layer.add_move_reflection.connect(map_add_move_reflection)
	
	agent.load_map()
	
	agent.current_map.show_skill_btn_pressed.connect(show_skill_btn_pressed)
	agent.current_map.behaviors_is_full.connect(change_behaviors_is_full)
	
	print("s_Playing_Init")
		
func update(delta:float):
	transform_to(StateEnum.GAME_STATE_TYPE.PLAYING_READY)
		
		
func exit():
	pass

func map_add_move_reflection(mouse_site:Vector2i, last_site:Vector2i):
	agent.current_map.add_move_reflection(mouse_site, last_site)

func show_skill_btn_pressed():
	if agent.ui_layer.get_ready_fight_form():
		agent.ui_layer.hide_ready_fight_form()
	else:
		agent.ui_layer.show_ready_fight_form()

func change_behaviors_is_full(Bool:bool):
	agent.ui_layer.change_behaviors_is_full(Bool)
