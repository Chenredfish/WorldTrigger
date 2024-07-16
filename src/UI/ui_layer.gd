extends CanvasLayer

@onready var main_form = %MainForm
@onready var ready_fight_form = %ReadyFightForm

signal btn_new_game_pressed
signal actor_add_move_behavior(site:Vector2i)
signal start_fight_button_pressed
	
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

#以下都是按鈕觸發

#按下左鍵
func left_pressed_mouse(mouse_site:Vector2i, actor_site:Vector2i):
	ready_fight_form.left_pressed_mouse(mouse_site, actor_site)

func _on_main_form_btn_new_game_pressed():
	btn_new_game_pressed.emit()


func _on_ready_fight_form_actor_add_move_behavior(site):
	actor_add_move_behavior.emit(site)

func _on_ready_fight_form_start_fight_button_pressed():
	start_fight_button_pressed.emit()
