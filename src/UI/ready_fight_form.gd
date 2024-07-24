extends Control

@onready var action_list_visable = $UIContainer/HBoxContainer2/ActionList/Panel
@onready var skill_container = $UIContainer/SkillContainer
@onready var skill_menu = $UIContainer/SkillContainer/SkillMenu
@onready var action_list = $UIContainer/HBoxContainer2/ActionList
@onready var ready_stage = $ReadyStage


signal add_skill(action : Button)
signal actor_add_behavior(add_behavior:BaseBehavior)
signal choose_move_site
signal add_move_reflection(site:Vector2i)
signal start_fight_button_pressed
signal remove_action

var is_choose_move_site:bool = false
var behaviors_is_full:bool = false

func _ready():
	skill_menu.add_skill.connect(panel_add_skill)

func show_actor_skill():
	skill_container.show()
	action_list_visable.show()

func hide_actor_skill():
	skill_container.hide()
	action_list_visable.hide()

func panel_add_skill(action : Button):
	
	#行動已經滿了，無法添加
	if behaviors_is_full:
		return
	
	#選擇移動到的位置
	hide_actor_skill()
	
	if action.text == "Move":
		is_choose_move_site = true
		await choose_move_site
		is_choose_move_site = false
	
	show_actor_skill()
	
	print(action.text)
	action_list.add_action(action)

func emit_choose_site(mouse_site:Vector2i, last_site:Vector2i, actor_site:Vector2i):
	
	if (last_site-mouse_site).length_squared() ==1 and is_choose_move_site:
		if abs(mouse_site.x - last_site.x)==1: #目標位置和角色位置距離為1
			#print("mouse_site:", mouse_site, ", actor_site:", actor_site)
			#要求角色增加行動
			actor_add_behavior.emit(NormalMove.new(mouse_site))
		elif abs(mouse_site.y - last_site.y)==1:
			actor_add_behavior.emit(NormalJump.new(mouse_site, actor_site))
			
		#新增殘影在滑鼠點擊位置
		add_move_reflection.emit(mouse_site)
		#技能介面的恢復
		choose_move_site.emit()

func left_pressed_mouse(mouse_site:Vector2i, last_site:Vector2i, actor_site:Vector2i):
	emit_choose_site(mouse_site, last_site, actor_site)

func remove_all_action():
	action_list.remove_all_action()
	ready_stage.change_ready()

func _on_start_button_pressed():
	start_fight_button_pressed.emit()
	ready_stage.change_ready()


func _on_action_list_remove_action():
	remove_action.emit()
