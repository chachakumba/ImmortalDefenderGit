extends Powerup
class_name PwUOldWiring

@export var amount : float = 0.25

func _activate():
	Player.Instance.movement._add_delay(amount)
