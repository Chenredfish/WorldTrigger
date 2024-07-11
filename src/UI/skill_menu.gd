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
	ult_button.pressed.connect(ult_skill_btn_pressed)
	button_1.pressed.connect(button1_skill_btn_pressed)
	button_2.pressed.connect(button2_skill_btn_pressed)
	button_3.pressed.connect(button3_skill_btn_pressed)
	button_4.pressed.connect(button4_skill_btn_pressed)
	button_5.pressed.connect(button5_skill_btn_pressed)

func ult_skill_btn_pressed():
	add_skill.emit(ult_button)

func button1_skill_btn_pressed():
	add_skill.emit(button_1)

func button2_skill_btn_pressed():
	add_skill.emit(button_2)

func button3_skill_btn_pressed():
	add_skill.emit(button_3)

func button4_skill_btn_pressed():
	add_skill.emit(button_4)

func button5_skill_btn_pressed():
	add_skill.emit(button_5)
