extends Powerup
class_name PwUOverdriveMod

func _activate():
	Player.Instance.can_alt_attack = true
