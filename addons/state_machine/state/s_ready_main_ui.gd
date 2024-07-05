extends BaseState
class_name s_Ready_Main_UI


var is_new_game:bool=false
	
func enter(_msg:Dictionary = {}):
	print("s_Ready_Main_UI")
	agent.ui_layer.show_main_form()
	agent.ui_layer.hide_ready_fight_form()
		
		
func update(delta):	
	if state_machine.has_value('is_new_game'): #更新狀態
		is_new_game = state_machine.get_value('is_new_game')

	if is_new_game:
		transform_to(StateEnum.GAME_STATE_TYPE.PLAYING_INIT)
		agent.ui_layer.hide_main_form()
		agent.ui_layer.start_main_form()
		
			
func exit():
	is_new_game = false
	state_machine.set_value('is_new_game', is_new_game)
		
