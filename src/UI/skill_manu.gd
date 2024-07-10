extends MarginContainer

@onready var ult_button = %SkillContainer/MarginContainer/UltButton
@onready var button_1 = %SkillContainer/MarginContainer2/Button1
@onready var button_2 = %SkillContainer/MarginContainer3/Button2
@onready var button_3 = %SkillContainer/MarginContainer4/Button3
@onready var button_4 = %SkillContainer/MarginContainer5/Button4
@onready var button_5 = %SkillContainer/MarginContainer6/Button5

signal add_skill(action : Button)

func _ready():
	ult_button.pressed.connect(self.skill_btn_pressed(0))
	button_1.pressed.connect(self.skill_btn_pressed(1))
	button_2.pressed.connect(self.skill_btn_pressed(2))
	button_3.pressed.connect(self.skill_btn_pressed(3))
	button_4.pressed.connect(self.skill_btn_pressed(4))
	button_5.pressed.connect(self.skill_btn_pressed(5))

func skill_btn_pressed(action : int):
	pass
