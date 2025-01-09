extends CanvasLayer
class_name PlayerUI

static var Instance : PlayerUI
@export var charge_slider : Slider
@export var overlay : TextureRect
@export var corner_crack : Control
@export var level_progress_slider : Slider

@export var levelup_panel : Control
@export var powerup_panels : Array[PowerupPrefab]

func _init():
	Instance = self

### Changes charge slider value (from 0 to 1)
func _update_charge_slider(percentage : float):
	charge_slider.value = percentage

func _set_corner_crack(state : bool):
	corner_crack.visible = state

func _set_crt_effect(state : bool):
	overlay.material.set_shader_parameter("use_crt", state)
func _set_fisheye_effect(state : bool):
	overlay.material.set_shader_parameter("use_fisheye", state)
func _set_rgb(vec3 : Vector3):
	overlay.material.set_shader_parameter("rgb_mult", vec3)
