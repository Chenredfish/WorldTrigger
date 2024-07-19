extends MarginContainer

@onready var actions = $Panel/Actions
@onready var show_button = $Panel/Actions/ShowButtonContainer/ShowButton
@onready var show_button_container = $Panel/Actions/ShowButtonContainer

var actions_num : int = 0

func _ready():
	show_button_container.hide()
	
func add_action(action : Button):
	
	if actions_num < 5:
		var new_action_container = MarginContainer.new()
		new_action_container.custom_minimum_size = show_button_container.custom_minimum_size
		actions.add_child(new_action_container)
		new_action_container.script = show_button_container.script
		
		var new_action = Button.new()
		new_action.theme = show_button.theme
		new_action.text = action.text
		new_action.add_theme_font_size_override("font_size", 11)
		new_action_container.add_child(new_action)
		new_action.pressed.connect(
			func():
				new_action_container.action_cancel()
				actions_num -= 1
		)
		actions_num += 1
