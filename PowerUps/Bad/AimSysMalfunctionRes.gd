extends Powerup
class_name PwUAimSystemMalfunction

var x_invert : bool

func _get_name() -> String:
	x_invert = randi()%2 == 1
	return name

func _activate():
	if x_invert:
		Player.Instance.looker.inverter.x = -Player.Instance.looker.inverter.x
	else:
		Player.Instance.looker.inverter.y = -Player.Instance.looker.inverter.y

func _get_description() -> String:
	if x_invert:
		return "invert x aim axis"
	return "invert y aim axis"
