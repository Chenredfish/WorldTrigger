extends Actor
class_name TestActor

signal show_skill_btn_pressed



func _init():
	super()
	trigger1 = TestTrigger.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_touch_screen_button_pressed():
	show_skill_btn_pressed.emit()
	
