extends Powerup
class_name PwUFixedCapacitators

@export var amount : int = 30

func _activate():
	Player.Instance.charge += amount
	Player.Instance.max_charge += amount
