extends Powerup
class_name PwUCircuitInterfierence

var x_invert : bool

func _get_name() -> String:
	x_invert = randi()%2 == 1
	return name

func _activate():
	if x_invert:
		Player.Instance.movement.inverter.x = -Player.Instance.movement.inverter.x
	else:
		Player.Instance.movement.inverter.y = -Player.Instance.movement.inverter.y

func _get_description() -> String:
	if x_invert:
		return "invert x move axis"
	return "invert y move axis"
