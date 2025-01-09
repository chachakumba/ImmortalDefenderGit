extends Powerup
class_name PwUBrokenAntenna

func _activate():
	MusicManager.Instance._set_white_noise(true)
