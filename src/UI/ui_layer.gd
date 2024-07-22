extends CanvasLayer

@onready var main_form = %MainForm
@onready var ready_fight_form = %ReadyFightForm

signal btn_new_game_pressed
signal actor_add_move_behavior(site:Vector2i)
signal start_fight_button_pressed
signal add_move_reflection(site:Vector2i)
signal remove_action
	
#開關UI
func start_main_form():
	ready_fight_form.show()
	ready_fight_form.hide_actor_skill()

func show_main_form():
	main_form.show()

func hide_main_form():
	main_form.hide()
	
	
func show_ready_fight_form():
	ready_fight_form.show()
	ready_fight_form.show_actor_skill()

func hide_ready_fight_form():
	ready_fight_form.hide_actor_skill()
	
func get_ready_fight_form():
	return ready_fight_form.action_list_visable.is_visible()

#刪除所有行動展示
func remove_all_action():
	ready_fight_form.remove_all_action()
	
#關閉或開啟新增行動
func change_behaviors_is_full(Bool:bool):
	print(Bool)
	ready_fight_form.behaviors_is_full = Bool

#以下都是按鈕觸發

#按下左鍵
func left_pressed_mouse(mouse_site:Vector2i, actor_site:Vector2i):
	ready_fight_form.left_pressed_mouse(mouse_site, actor_site)

func _on_main_form_btn_new_game_pressed():
	btn_new_game_pressed.emit()

func _on_ready_fight_form_start_fight_button_pressed():
	start_fight_button_pressed.emit()


func _on_ready_fight_form_actor_add_move_behavior(site:Vector2i):
	actor_add_move_behavior.emit(site)


func _on_ready_fight_form_add_move_reflection(site:Vector2i):
	add_move_reflection.emit(site)


func _on_ready_fight_form_remove_action():
	remove_action.emit()
