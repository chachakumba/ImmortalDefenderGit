extends CanvasLayer
class_name PlayerUI

static var Instance : PlayerUI
@export var charge_slider : Slider
@export var overlay_shader : ShaderMaterial

func _init():
	Instance = self

### Changes charge slider value (from 0 to 1)
func _update_charge_slider(percentage : float):
	charge_slider.value = percentage

func _set_crt_effect(state : bool):
	overlay_shader.set_shader_parameter("use_crt", state)
func _set_fisheye_effect(state : bool):
	overlay_shader.set_shader_parameter("use_fisheye", state)
