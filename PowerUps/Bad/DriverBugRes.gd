extends Powerup
class_name PwUDriverBug

@export var lense_malfunction_powerup : Powerup

func _activate():
	PlayerUI.Instance._set_crt_effect(true)
	Player.Instance._add_neg_powerup(lense_malfunction_powerup)
