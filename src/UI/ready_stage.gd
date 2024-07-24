extends PanelContainer

@onready var label = $Label

var animation_time : float = 0.5
var y_location : float = -80
var y_location_start : float = -80
var y_location_end : float = 40
var timing : bool = true
var show_or_hide : bool = true

func _process(delta : float) -> void:
	if timing:
		if show_or_hide:
			show_ready(delta)
		else:
			hide_ready(delta)

func show_ready(time : float):
	if y_location <= y_location_end :
		y_location += time*400
		self.position.y = y_location
	else:
		y_location = y_location_end

func hide_ready(time : float):
	if y_location >= y_location_start :
		y_location -= time*400
		self.position.y = y_location
	else:
		y_location = y_location_start

func change_ready():
	show_or_hide = false
	timing = true
	await get_tree().create_timer(0.4).timeout
	change_ready_label()
	show_or_hide = true
	await get_tree().create_timer(0.4).timeout
	timing = false

func change_ready_label():
	if label.text == "Ready Stage":
		label.text = "Action Stage"
	else:
		label.text = "Ready Stage"
