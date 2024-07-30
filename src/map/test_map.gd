extends TileMap
class_name TestMap

signal show_skill_btn_pressed
signal behavior_over
signal behaviors_is_full(Bool:bool)

const TEST_ACTOR = preload("res://src/actor/test_actor.tscn")
const SANDBAG = preload("res://src/enemy/sandbag.tscn")
const TEST_ACTOR_ROLL_REFLECTION = preload("res://src/actor/test_actor_roll_reflection.tscn")

@export var actor_start_position:Vector2i = Vector2i(5,5)
@export var enemy_start_position:Vector2i = Vector2i(9,5)

var actor:TestActor
var enemy:Sandbag
var actor_reflections:Array[TestActorRollReflection]


# Called when the node enters the scene tree for the first time.
func _ready():
	
	#新增玩家
	actor = add_role(TEST_ACTOR, actor_start_position)
	actor.show_skill_btn_pressed.connect(_on_show_skill_btn_pressed)
	actor.move_actor.connect(_move_actor)
	actor.jump_actor.connect(_jump_actor)
	actor.make_damage.connect(_make_damage)
	self.add_child(actor)
	

	#新增敵人
	enemy = add_role(SANDBAG, enemy_start_position)
	enemy.add_to_group("enemys")
	self.add_child(enemy)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_actor_map_position():
	if actor:
		return self.local_to_map(actor.get_position()) ####大問題!!!
		
func get_reflection_map_position():
	if actor_reflections[-1]:
		return self.local_to_map(actor_reflections[-1].get_position())

func _on_show_skill_btn_pressed():
	show_skill_btn_pressed.emit()

func _move_actor(aim_site:Vector2i, moved_actor:Node2D):
	#aim_site-=Vector2i(1,1) #####大問題產生的問題
	moved_actor.play_run_animate()
	
	while self.map_to_local(aim_site) != moved_actor.get_position():
		if self.map_to_local(aim_site).x > moved_actor.get_position().x:
			moved_actor.position.x+=2
			moved_actor.turn_right()
		else:
			moved_actor.position.x-=2
			moved_actor.turn_left()
		
		await get_tree().create_timer(0.1).timeout
		
	#print(aim_site)
	await moved_actor.test_actor_animate.animation_finished
	
	behavior_over.emit()
	
	remove_move_reflection(0)
	
func _jump_actor(aim_site:Vector2i, moved_actor:Node2D):
	#aim_site-=Vector2i(1,1) #####大問題產生的問題
	moved_actor.play_run_animate()
	
	while self.map_to_local(aim_site) != moved_actor.get_position():
		if self.map_to_local(aim_site).y > moved_actor.get_position().y:
			moved_actor.position.y+=2
			moved_actor.turn_right()
		else:
			moved_actor.position.y-=2
			moved_actor.turn_left()
		
		await get_tree().create_timer(0.1).timeout
		
	await moved_actor.test_actor_animate.animation_finished
		
	#print(aim_site)
	behavior_over.emit()
	
	remove_move_reflection(0)
	
func _make_damage(damage:int, attack_site:Vector2i, attack_from:Node2D):
	#print("attack_site:",attack_site)
	#print("enemy_site:", local_to_map(enemy.get_position()))
	if attack_from is TestActor:
		attack_from.play_attack_animate()
		
		for enemy in get_tree().get_nodes_in_group("enemys"):
			if local_to_map(enemy.get_position()) == attack_site:
				print("enemy take damage")
				enemy.take_damage(damage)
	
	await attack_from.test_actor_animate.animation_finished
	behavior_over.emit()

func add_role(preload_role, position:Vector2i):
	var role:Node2D
	role = preload_role.instantiate()
	role.set_position(Vector2(self.map_to_local(position)))
	
	return role
	
#新增移動的殘影
func add_move_reflection(site:Vector2i):
	actor_reflections.append(add_role(TEST_ACTOR_ROLL_REFLECTION, site))
	self.add_child(actor_reflections[-1])
	
func remove_move_reflection(remove_number:int):
	if actor_reflections[remove_number]:
		actor_reflections[remove_number].queue_free()
		if remove_number == -1:
			actor_reflections.resize(actor_reflections.size() - 1)
		else:
			actor_reflections.remove_at(remove_number)

func actor_add_behavior(added_behavior:BaseBehavior):
	actor.add_behavior(added_behavior)
	#elif correct_actor_site.y - aim_site.y:
	#偵測是否滿行動
	_test_behaviors_is_full()

func actor_add_jump_behavior(aim_site:Vector2i):
	actor.add_behavior(NormalJump.new(aim_site, local_to_map(actor.get_position())))
	_test_behaviors_is_full()

func actor_take_behavior():
	actor.take_behavior() #執行階段
	
func actor_remove_behavior():
	actor.remove_behavior() #執行階段
	
	_test_behaviors_is_full()
	
func actor_remove_top_behavior(): #返回行動
	actor.remove_top_behavior()
	
	_test_behaviors_is_full()

func has_actor_reflection()->bool:
	if actor_reflections:
		return true
	else:
		return false

func _test_behaviors_is_full():
	if actor.get_current_behaviors_amount() >= actor.max_behavior_amount:
		behaviors_is_full.emit(true)
	else :
		behaviors_is_full.emit(false)
