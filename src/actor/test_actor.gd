extends Actor
class_name TestActor

signal show_skill_btn_pressed

@onready var test_actor_animate:AnimatedSprite2D = %test_actor_animate


func _init():
	super()
	trigger1 = TestTrigger.new()


#func emit_tilemap_move_self(input_aim_site:Vector2i):
	#super(input_aim_site)
	

func play_run_animate():
	test_actor_animate.play("roll")
	await test_actor_animate.animation_finished
	test_actor_animate.play("idle")

func turn_right():
	test_actor_animate.flip_h = false
	
func turn_left():
	test_actor_animate.flip_h = true

func _on_touch_screen_button_pressed():
	show_skill_btn_pressed.emit()
	
