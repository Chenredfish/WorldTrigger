extends Node2D
class_name Test_actor

signal show_skill_btn_pressed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_show_skill_btn_pressed():
	show_skill_btn_pressed.emit()
