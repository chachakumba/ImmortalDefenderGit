extends Powerup
class_name PwURecalibratedServimotors

@export var amount : float = 50

func _activate():
	Player.Instance.movement.speed += amount
