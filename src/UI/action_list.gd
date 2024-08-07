extends MarginContainer

@onready var actions = $VBoxContainer/Panel/Actions
@onready var show_button = $VBoxContainer/Panel/Actions/ShowButtonContainer/ShowButton
@onready var show_button_container = $VBoxContainer/Panel/Actions/ShowButtonContainer
@onready var actions_num_label = $VBoxContainer/PanelContainer/ActionsNumLabel


signal remove_action(action_text:String)
signal action_end

var actions_num : int = 0
var current_actions:Array[ShowButtonContainer]


func _ready():
	show_button_container.hide()
	
func add_action(action : Button):
	
	if actions_num < 7:
		current_actions.append(ShowButtonContainer.new())
		current_actions[-1].custom_minimum_size = show_button_container.custom_minimum_size
		actions.add_child(current_actions[-1])
		
		var new_action = Button.new()
		new_action.theme = show_button.theme
		new_action.text = action.text
		new_action.add_theme_font_size_override("font_size", 11)
		current_actions[-1].add_child(new_action)
		actions_num += 1
		new_action.pressed.connect(
			func():
				remove_action.emit(current_actions[-1].get_child(0).text)
				current_actions[-1].queue_free()
				current_actions.resize(current_actions.size()-1)
				
				actions_num -= 1
				
		)
		change_label()
		
func remove_all_action():
	while current_actions:
		current_actions[0].queue_free()
		current_actions.remove_at(0)
		actions_num -= 1
	action_end.emit()
	actions_num = 0
	change_label()

func change_label():
	actions_num_label.text = str(actions_num) + " / 7"
