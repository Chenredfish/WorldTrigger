extends TileMap
class_name TestMap

const TEST_ACTOR = preload("res://src/actor/test_actor.tscn")

@export var start_position:Vector2i = Vector2i(4,4)

var actor:Test_actor

# Called when the node enters the scene tree for the first time.
func _ready():
	actor = TEST_ACTOR.instantiate()
	actor.set_position(Vector2(map_to_local(start_position)))
	self.add_child(actor)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_actor_map_position():
	if actor:
		return self.local_to_map(actor.get_position())
