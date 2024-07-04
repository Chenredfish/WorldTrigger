extends Node2D
class_name TestActor

signal show_skill_btn_pressed
signal actor_die

@export var attack_amount:int ##攻擊力
@export var behavior_amount:int ##行動段數
@export var max_health:int ##最大生命值
@export var avoid:int ##閃避機率(0~100)
@export var trigger:TestTrigger = TestTrigger.new()

var current_trigger:TestTrigger
var current_health:int ##現在血量
var behaviors = []   ##陣列不能限定類別，切記這裡一定要放行動Behavior!!!

# Called when the node enters the scene tree for the first time.
func _ready():
	current_health = max_health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func take_behavior(behavior:Behavior):
	pass
	
func take_damage():
	pass
	
func die():
	actor_die.emit()

func _on_show_skill_btn_pressed():
	pass


func _on_touch_screen_button_pressed():
	show_skill_btn_pressed.emit()
	
