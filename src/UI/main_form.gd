extends Control

signal btn_new_game_pressed

func _on_new_game_pressed():
	btn_new_game_pressed.emit()
