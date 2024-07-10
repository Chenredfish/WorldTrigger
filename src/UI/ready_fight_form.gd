extends Control

@onready var panel = $UIContainer/HBoxContainer2/ActionList/Panel
@onready var skill_container = $UIContainer/SkillContainer
@onready var skill_menu = $UIContainer/SkillContainer/SkillMenu

var SkillMenu : skillmenu

func _ready():
	SkillMenu.add_skill.connect(self.panel_add_skill)

func show_actor_skill():
	skill_container.show()
	panel.show()

func hide_actor_skill():
	skill_container.hide()
	panel.hide()

func panel_add_skill(action : Button):
	pass
