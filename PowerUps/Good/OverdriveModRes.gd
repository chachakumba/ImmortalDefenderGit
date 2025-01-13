extends Powerup
class_name PwUOverdriveMod

func _activate():
	AttackManager.Instance.can_alt_attack = true
