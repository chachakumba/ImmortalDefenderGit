extends Node2D
class_name Looker

var inverter : Vector2i = Vector2i(1,1)

func _process(_delta):
	var mouse_pos = get_global_mouse_position() - global_position
	mouse_pos.x *= inverter.x
	mouse_pos.y *= inverter.y
	look_at(global_position + mouse_pos)
