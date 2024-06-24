extends CanvasLayer

@onready var main_form = %MainForm
@onready var ready_fight_form = %ReadyFightForm

signal btn_new_game_pressed



#開關UI
func show_main_form():
	main_form.show()

func hide_main_form():
	main_form.hide()
	
	
func show_ready_fight_form():
	ready_fight_form.show()

func hide_ready_fight_form():
	ready_fight_form.hide()


#以下都是按鈕觸發


func _on_main_form_btn_new_game_pressed():
	btn_new_game_pressed.emit()
