extends MarginContainer
class_name skillmenu

@onready var ult_button = %SkillContainer/MarginContainer/UltButton
@onready var button_1 = %SkillContainer/MarginContainer2/Button1
@onready var button_2 = %SkillContainer/MarginContainer3/Button2
@onready var button_3 = %SkillContainer/MarginContainer4/Button3
@onready var button_4 = %SkillContainer/MarginContainer5/Button4
@onready var button_5 = %SkillContainer/MarginContainer6/Button5

signal add_skill(action : Button)

func _ready():
	#ult_button.pressed.connect(skill_btn_pressed(ult_button))
	#button_1.pressed.connect(skill_btn_pressed(button_1))
	#button_2.pressed.connect(skill_btn_pressed(button_2))
	#button_3.pressed.connect(skill_btn_pressed(button_3))
	#button_4.pressed.connect(skill_btn_pressed(button_4))
	#button_5.pressed.connect(skill_btn_pressed(button_5))
	pass

func skill_btn_pressed(action : Button):
	add_skill.emit(action)
