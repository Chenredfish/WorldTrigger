extends Node2D

#狀態機
@onready var game_state_machine = $GameStateMachine
#UI
@onready var ui_layer = %UILayer
#地圖
@export var TEST_MAP = preload("res://src/map/test_map.tscn")

var current_map:TileMap		
var mouse_position_tile_map:Vector2i

# Called when the node enters the scene tree for the first time.
func _ready():
	ui_layer.show()
	game_state_machine.launch()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func load_map():
	current_map = TEST_MAP.instantiate()
	self.add_child(current_map)	
	
func get_mouse_position_tile_map():
	if current_map:
		return current_map.local_to_map(current_map.get_local_mouse_position())
		
		
func get_map_actor_map_position():
	if current_map:
		return current_map.get_actor_map_position()
		
func get_map_reflection_position():
	if current_map:
		return current_map.get_reflection_map_position()

func _on_ui_layer_btn_new_game_pressed():
	game_state_machine.set_value('is_new_game', true)

func _on_ui_layer_actor_add_move_behavior(site):
	if current_map:
		current_map.actor_add_move_behavior(site)

func _on_ui_layer_start_fight_button_pressed():
	game_state_machine.set_value('is_fighting', true)

func _on_ui_layer_remove_action():
	if current_map:
		current_map.actor_remove_top_behavior()
		current_map.remove_move_reflection(-1)
