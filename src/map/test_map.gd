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
	self.add_child(actor)
	
	#新增敵人
	enemy = add_role(SANDBAG, enemy_start_position)
	self.add_child(enemy)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_actor_map_position():
	if actor:
		return self.local_to_map(actor.get_position())

func _on_show_skill_btn_pressed():
	show_skill_btn_pressed.emit()

func add_role(preload_role, position:Vector2i):
	var role:Node2D
	role = preload_role.instantiate()
	role.set_position(Vector2(map_to_local(position)))
	
	return role
