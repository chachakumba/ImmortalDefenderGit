extends CharacterBody2D
class_name Enemy

var player : Player
@export var attack_damage : float
@export var health : float
@export var damage : float

signal on_damage

@export var battery_scene : Battery
var battery_parent : Node2D

func _ready():
	player = Player.Instance

func _get_damage(amount : float):
	health -= amount
	on_damage.emit()
	if health <= 0:
		_die()

func _die():
	queue_free()
