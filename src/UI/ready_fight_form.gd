extends Control

@onready var action_list_visable = $UIContainer/HBoxContainer2/ActionList/Panel
@onready var skill_container = $UIContainer/SkillContainer
@onready var skill_menu = $UIContainer/SkillContainer/SkillMenu
@onready var action_list = $UIContainer/HBoxContainer2/ActionList

signal add_skill(action : Button)
signal actor_add_move_behavior(site : Vector2i)
signal choose_move_site
signal add_move_reflection(site:Vector2i)
signal start_fight_button_pressed

var is_choose_move_site:bool = false

func _ready():
	skill_menu.add_skill.connect(panel_add_skill)

func show_actor_skill():
	skill_container.show()
	action_list_visable.show()

func hide_actor_skill():
	skill_container.hide()
	action_list_visable.hide()

func panel_add_skill(action : Button):
	
	
	#選擇移動到的位置
	hide_actor_skill()
	is_choose_move_site = true
	await choose_move_site
	show_actor_skill()
	is_choose_move_site = false
	
	print(action.text)
	action_list.add_action(action)

func emit_choose_move_site(mouse_site:Vector2i, actor_site:Vector2i):
	if (mouse_site - actor_site).length_squared() == 1 and is_choose_move_site: #目標位置和角色位置距離為1
		#技能介面的恢復
		choose_move_site.emit()
		
		#要求角色增加行動
		actor_add_move_behavior.emit(mouse_site)
		
		#新增殘影在滑鼠點擊位置
		add_move_reflection.emit(mouse_site)

func left_pressed_mouse(mouse_site:Vector2i, actor_site:Vector2i):
	emit_choose_move_site(mouse_site, actor_site)


func _on_start_button_pressed():
	start_fight_button_pressed.emit()
