extends Node2D
class_name EnemySpawner

@export var player: Player

@export var enemies_prefabs : Array[PackedScene]
@export var enemies_parent : Node2D
@export var batteries_parent : Node2D
@export var projectiles_parent : Node2D

var spawnpoints : Array[Vector2] = [Vector2(650,0),Vector2(-650,0),Vector2(0,350),Vector2(0,-350),
Vector2(650,350),Vector2(-650,350),Vector2(650,-350),Vector2(-650,-350),
Vector2(325,350),Vector2(-325,350),Vector2(325,-350),Vector2(-325,-350),
Vector2(650,175),Vector2(-650,175),Vector2(650,-175),Vector2(-650,-175),
]

@export var is_running : bool = false

var time_to_spawn : float = 0
@export var spawn_delay : float = 3
@export var spawn_radius : float = 10 #not actually radius, but x and/or y distance from player
var paused : bool = false

func _ready() -> void:
	Player.Instance.on_level_up.connect(_pause)
	Player.Instance.on_chosen_powerup.connect(_unpause)

func _pause():
	paused = true
func _unpause():
	paused = true

func _process(delta):
	if !is_running || paused:
		return
	
	time_to_spawn -= delta
	if time_to_spawn <= 0:
		time_to_spawn = spawn_delay
		_spawn()

func _spawn():
	var spawned_enemy : Enemy = enemies_prefabs.pick_random().instantiate()
	enemies_parent.add_child(spawned_enemy)
	spawned_enemy.spawner = self
	spawned_enemy._set_level(LevelManager.Instance.level)
	spawned_enemy.global_position = player.global_position + spawnpoints.pick_random()
