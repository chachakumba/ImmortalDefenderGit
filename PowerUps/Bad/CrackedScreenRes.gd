extends Powerup
class_name PwUCrackedScreen

func _activate():
	PlayerUI.Instance._set_corner_crack(true)
