extends Powerup
class_name PwUGPUDegradation

static var available_colors : Array[String] = ["red","green","blue"]
var current_color : String

func _get_name() -> String:
	current_color = available_colors.pick_random()
	return name

func _activate():
	match current_color:
		"red":
			PlayerUI.Instance._subtract_rgb(Vector3(1,0,0))
		"green":
			PlayerUI.Instance._subtract_rgb(Vector3(0,1,0))
		"blue":
			PlayerUI.Instance._subtract_rgb(Vector3(0,0,1))
	available_colors.erase(current_color)

func _get_description() -> String:
	if available_colors.size() == 1:
		return "remove all colors"
	
	return "remove all " + current_color + " colors"
