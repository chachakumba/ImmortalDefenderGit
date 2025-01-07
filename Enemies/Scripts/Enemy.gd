extends CharacterBody2D
class_name Enemy

var player : Player
@export var health : float
@export var damage : float
@export var battery_charge : float

signal on_damage

@export var battery_scene : PackedScene
var battery_parent : Node2D

func _ready():
	player = Player.Instance

func _get_damage(amount : float):
	health -= amount
	on_damage.emit()
	if health <= 0:
		_die()

func _die():
	var battery : Battery = battery_scene.instantiate()
	battery.charge = battery_charge
	battery_parent.add_child(battery)
	battery.global_position = global_position
	queue_free()
