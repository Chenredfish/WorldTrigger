extends BaseState
class_name s_Playing_Init

func enter(_msg:Dictionary = {}):
		agent.load_map()
		print("s_Playing_Init")
		
func update(delta:float):
	if Input.is_action_just_pressed("left_mouse_pressed") :
		print("滑鼠位置：", agent.get_mouse_position_tile_map())
		print("操作物位置", agent.get_map_actor_map_position())
		if agent.get_map_actor_map_position() == agent.get_mouse_position_tile_map():
			agent.ui_layer.show_ready_fight_form()
		else:
			agent.ui_layer.hide_ready_fight_form()
