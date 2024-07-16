extends BaseState
class_name s_Playing_Init

const MOUSE_FRAME = preload("res://src/map/mouse_frame.tscn")
var mouse_frame:Node2D

var is_fighting:bool = false

func enter(_msg:Dictionary = {}):
	agent.ui_layer.start_main_form()
	
	agent.load_map()
	agent.current_map.show_skill_btn_pressed.connect(show_skill_btn_pressed)
	
	mouse_frame = MOUSE_FRAME.instantiate()
	agent.add_child(mouse_frame)
		
	_update_mouse_frame()
	print("s_Playing_Init")
		
func update(delta:float):
	
	_update_mouse_frame()
	if Input.is_action_just_pressed("left_mouse_pressed"):
		agent.ui_layer.left_pressed_mouse(agent.get_mouse_position_tile_map(), agent.get_map_actor_map_position())
	
	if state_machine.has_value('is_fighting'): #更新狀態
		is_fighting = state_machine.get_value('is_fighting')
	if is_fighting:
		transform_to(StateEnum.GAME_STATE_TYPE.PLAYING_READY)
		
		
func exit():
	agent.current_map.show_skill_btn_pressed.disconnect(show_skill_btn_pressed)
	
	is_fighting = false
	state_machine.set_value('is_fighting', is_fighting)
	agent.ui_layer.hide_ready_fight_form()

func _update_mouse_frame():
	#print(agent.current_map.map_to_local(agent.get_mouse_position_tile_map()))
	
	#scale的兩個值一樣，只取一個
	var tilemap_scale = agent.current_map.get_scale().x
	var tilemap_rendering_quadrant_size = agent.current_map.get_rendering_quadrant_size()
	mouse_frame.set_position(agent.get_mouse_position_tile_map()*tilemap_rendering_quadrant_size*tilemap_scale)

func show_skill_btn_pressed():
	if agent.ui_layer.get_ready_fight_form():
		agent.ui_layer.hide_ready_fight_form()
	else:
		agent.ui_layer.show_ready_fight_form()
