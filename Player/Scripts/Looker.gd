extends Node2D
class_name Looker

var inverter : Vector2i = Vector2i(1,1)
var relative_mod_mouse : Vector2

func _process(_delta):
	var mouse_pos = get_global_mouse_position() - global_position
	mouse_pos.x *= inverter.x
	mouse_pos.y *= inverter.y
	relative_mod_mouse = mouse_pos
	look_at(global_position + mouse_pos)
