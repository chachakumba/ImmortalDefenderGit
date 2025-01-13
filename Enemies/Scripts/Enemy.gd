extends CharacterBody2D
class_name Enemy

var player : Player
@export var health : float
@export var damage : float
@export var battery_charge : float
var spawner : EnemySpawner

signal on_damage

@export var battery_scene : PackedScene

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
	spawner.batteries_parent.add_child(battery)
	battery.global_position = global_position
	queue_free()

func _set_level(level : int):
	health += health/10*level
	damage += damage/10*level
