extends BaseState
class_name s_Playing_Init

const MOUSE_FRAME = preload("res://src/map/mouse_frame.tscn")
var mouse_frame:Node2D

func enter(_msg:Dictionary = {}):
		agent.load_map()
	
		mouse_frame = MOUSE_FRAME.instantiate()
		agent.add_child(mouse_frame)
		
		_update_mouse_frame()
		print("s_Playing_Init")
		
func update(delta:float):
	
	_update_mouse_frame()
	

func _update_mouse_frame():
	#print(agent.current_map.map_to_local(agent.get_mouse_position_tile_map()))
	
	#scale的兩個值一樣，只取一個
	var tilemap_scale = agent.current_map.get_scale().x
	var tilemap_rendering_quadrant_size = agent.current_map.get_rendering_quadrant_size()
	mouse_frame.set_position(agent.get_mouse_position_tile_map()*tilemap_rendering_quadrant_size*tilemap_scale)
