extends TileMap
class_name TestMap

signal show_skill_btn_pressed

const TEST_ACTOR = preload("res://src/actor/test_actor.tscn")
const SANDBAG = preload("res://src/enemy/sandbag.tscn")

@export var actor_start_position:Vector2i = Vector2i(4,4)
@export var enemy_start_position:Vector2i

var actor:TestActor
var enemy:Sandbag

# Called when the node enters the scene tree for the first time.
func _ready():
	
	#新增玩家
	actor = add_role(TEST_ACTOR, actor_start_position)
	actor.show_skill_btn_pressed.connect(_on_show_skill_btn_pressed)
	actor.move_actor.connect(_move_actor)
	self.add_child(actor)
	
	#新增敵人
	enemy = add_role(SANDBAG, enemy_start_position)
	self.add_child(enemy)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_actor_map_position():
	if actor:
		return self.local_to_map(actor.get_position())+Vector2i(1,1) ####大問題!!!

func _on_show_skill_btn_pressed():
	
	
	show_skill_btn_pressed.emit()

func _move_actor(aim_site:Vector2i, moved_actor:Node2D):
	aim_site-=Vector2i(1,1) #####大問題產生的問題
	moved_actor.play_run_animate()
	while self.map_to_local(aim_site) != moved_actor.get_position():
		if self.map_to_local(aim_site).x > moved_actor.get_position().x:
			moved_actor.position.x+=2
			moved_actor.turn_right()
		else:
			moved_actor.position.x-=2
			moved_actor.turn_left()
			print("_move_actor")
			
		await get_tree().create_timer(0.1).timeout

func add_role(preload_role, position:Vector2i):
	var role:Node2D
	role = preload_role.instantiate()
	role.set_position(Vector2(self.map_to_local(position)))
	
	return role

func actor_add_move_behavior(aim_site:Vector2i):
	actor.add_behavior(NormalMove.new(aim_site))

func actor_take_behavior():
	actor.take_behavior() #執行階段
	
func actor_remove_behavior():
	actor.remove_behavior() #執行階段
