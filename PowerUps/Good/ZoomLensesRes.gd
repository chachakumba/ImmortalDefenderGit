extends Powerup
class_name PwUZoomLenses

@export var amount : float = 0.15

func _activate():
	Player.Instance.camera.zoom -= Vector2i.ONE * amount
