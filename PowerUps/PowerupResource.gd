extends Resource
class_name Powerup

@export var name : String
@export_multiline var description : String
@export var amount_in_pool : int = 1

func _get_name() -> String:
	return name

func _activate():
	pass

func _get_description() -> String:
	return description
