extends Powerup
class_name PwULenseMalfunction

func _activate():
	PlayerUI.Instance._set_fisheye_effect(true)
