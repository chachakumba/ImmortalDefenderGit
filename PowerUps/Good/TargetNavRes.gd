extends Powerup
class_name PwUTargetNavigationModule

func _activate():
	AttackManager.Instance.can_shoot = true
