extends Powerup
class_name PwUMultitaskingChip

@export var amount : float = 0.5

func _get_description() -> String:
	if amount_in_pool == 2:
		return "Attacking won't freeze movement"
	return "Attacking won't slow movement"


func _activate():
	Player.Instance.movement.attack_move_multiplier += amount
