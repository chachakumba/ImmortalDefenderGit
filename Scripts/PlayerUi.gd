extends Control
class_name PlayerUI

@export var charge_slider : Slider

### Changes charge slider value (from 0 to 1)
func _update_charge_slider(percentage : float):
	charge_slider.value = percentage
