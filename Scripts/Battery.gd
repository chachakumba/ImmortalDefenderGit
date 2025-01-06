extends Node
class_name Battery

@export var attrackt_distance : float

var added_charge : float = 0

func _set_charge(amount : float):
	added_charge = amount

func _pick_up():
	Player.Instance.charge(added_charge)
