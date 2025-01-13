extends Node
class_name AttackManager

static var Instance : AttackManager
 
var shifting : bool = false

var can_alt_attack : bool = false
var can_shoot : bool = false

func _init() -> void:
	Instance = self

func _process(delta: float) -> void:
	
	if Input.is_action_just_released("AttackMele"):
		if shifting && can_alt_attack:
			Player.Instance._change_state(Player.State.Attack2)
		else:
			Player.Instance._change_state(Player.State.Attack1)
	
	if Input.is_action_just_released("AttackRanged") && can_shoot:
		if shifting && can_alt_attack:
			Player.Instance._change_state(Player.State.Shoot2)
		else:
			Player.Instance._change_state(Player.State.Shoot1)

func _attack1():
	pass

func _attack2():
	pass

func _shoot1():
	pass

func _shoot2():
	pass
