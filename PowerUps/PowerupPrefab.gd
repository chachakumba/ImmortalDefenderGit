extends Control
class_name PowerupPrefab

var pos_powerup : Powerup
var neg_powerup : Powerup

@export var pos_name_label : Label
@export var pos_desc_label : Label
@export var neg_name_label : Label
@export var neg_desc_label : Label

@export var id : int = 0

func _bind_pos(positive_powerup : Powerup):
	pos_powerup = positive_powerup
	pos_name_label.text = pos_powerup._get_name()
	pos_desc_label.text = pos_powerup._get_description()

func _bind_neg(negative_powerup : Powerup):
	neg_powerup = negative_powerup
	neg_name_label.text = neg_powerup._get_name()
	neg_desc_label.text = neg_powerup._get_description()

func _choose():
	pos_powerup._activate()
	neg_powerup._activate()
	LevelManager.Instance._powerup_chosen(self)
