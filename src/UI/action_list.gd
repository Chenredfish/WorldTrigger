extends MarginContainer

@onready var actions = $Panel/Actions
@onready var show_button = $Panel/Actions/ShowButtonContainer/ShowButton
@onready var show_button_container = $Panel/Actions/ShowButtonContainer

signal remove_action
signal action_end

var actions_num : int = 0
var current_actions:Array[ShowButtonContainer]


func _ready():
	show_button_container.hide()
	
func add_action(action : Button):
	
	if actions_num < 5:
		current_actions.append(ShowButtonContainer.new())
		current_actions[-1].custom_minimum_size = show_button_container.custom_minimum_size
		actions.add_child(current_actions[-1])
		
		var new_action = Button.new()
		new_action.theme = show_button.theme
		new_action.text = action.text
		new_action.add_theme_font_size_override("font_size", 11)
		current_actions[-1].add_child(new_action)
		new_action.pressed.connect(
			func():
				current_actions[0].queue_free()
				current_actions.remove_at(0)
				
				remove_action.emit()
				
				actions_num -= 1
				
		)
		actions_num += 1

func remove_all_action():
	while current_actions:
		current_actions[0].queue_free()
		current_actions.remove_at(0)
		actions_num -= 1
	action_end.emit()
