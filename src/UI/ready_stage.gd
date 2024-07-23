extends PanelContainer

var animation_time : float = 0.5
var y_location : float = -80
var y_location_start : float = -80
var y_location_end : float = 40
var timing : bool = false

func _process(delta : float) -> void:
	if timing:
		show_ready(delta)
	else:
		hide_ready(delta)


func show_ready(time : float):
	if y_location <= y_location_end :
		y_location += time*150
		self.position.y = y_location
	else:
		y_location = y_location_end


func hide_ready(time : float):
	if y_location >= y_location_start :
		y_location -= time*150
		self.position.y = y_location
	else:
		y_location = y_location_start
