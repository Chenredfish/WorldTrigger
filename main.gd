extends Node2D

#狀態機
@onready var game_state_machine = $GameStateMachine
#UI
@onready var ui_layer = %UILayer


# Called when the node enters the scene tree for the first time.
func _ready():
	ui_layer.show()
	game_state_machine.launch()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_ui_layer_btn_new_game_pressed():
	game_state_machine.set_value('is_new_game', true)
