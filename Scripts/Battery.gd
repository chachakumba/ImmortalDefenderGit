extends Node
class_name Battery

@export var attract_distance : float

var charge : float = 0

func _set_charge(amount : float):
	charge = amount

func _pick_up():
	Player.Instance._charge(charge)
	queue_free()

func _on_player_enter(player : Node2D):
	if player.name == "player":
		_pick_up()
