extends Control

@onready var action_list_visable = $UIContainer/HBoxContainer2/ActionList/Panel
@onready var skill_container = $UIContainer/SkillContainer
@onready var skill_menu = $UIContainer/SkillContainer/SkillMenu
@onready var action_list = $UIContainer/HBoxContainer2/ActionList

signal add_skill(action : Button)
signal choose_move_site

func _ready():
	skill_menu.add_skill.connect(panel_add_skill)

func show_actor_skill():
	skill_container.show()
	action_list_visable.show()

func hide_actor_skill():
	skill_container.hide()
	action_list_visable.hide()

func panel_add_skill(action : Button):
	
	hide_actor_skill()
	await choose_move_site
	show_actor_skill()
	
	print(action.text)
	action_list.add_action(action)

func emit_choose_move_site(mouse_site:Vector2i, actor_site:Vector2i):
	if (mouse_site - actor_site).length_squared() == 1:
		choose_move_site.emit()

func left_pressed_mouse(mouse_site:Vector2i, actor_site:Vector2i):
	emit_choose_move_site(mouse_site, actor_site)
