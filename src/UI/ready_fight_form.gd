extends Control

@onready var panel = $UIContainer/HBoxContainer2/MarginContainer/Panel
@onready var skill_container = $UIContainer/SkillContainer
@onready var skill_menu = $UIContainer/SkillContainer/SkillMenu

func show_actor_skill():
	skill_container.show()
	panel.show()

func hide_actor_skill():
	skill_container.hide()
	panel.hide()

func panel_add_skill():
	pass
