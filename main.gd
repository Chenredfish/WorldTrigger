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
	
	current_map.show_skill_btn_pressed.connect(
		func ():
			if ui_layer.get_ready_fight_form():
				ui_layer.hide_ready_fight_form()
			else:
				ui_layer.show_ready_fight_form()
	)
	
	
func get_mouse_position_tile_map():
	if current_map:
		return current_map.local_to_map(current_map.get_local_mouse_position())
		
		
func get_map_actor_map_position():
	if current_map:
		return current_map.get_actor_map_position()
		

func _on_ui_layer_btn_new_game_pressed():
	game_state_machine.set_value('is_new_game', true)
