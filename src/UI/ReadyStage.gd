extends MarginContainer

@onready var label = $MarginContainer/Label

@export var start_location : Vector2 = Vector2(394, -80)
@export var animation_time : float = 0.5

func _ready():
	self.position = start_location

func change_text(ready : bool):
	if ready == true : 
		label.text = "Ready Stage"
	else:
		label.text = "Execute Stage"

func move_animation():
	pass

func _process(delta: float) -> void:
	if delta <= animation_time:
		var new_location : Vector2 = Vector2(394, (delta)**(0.5))
