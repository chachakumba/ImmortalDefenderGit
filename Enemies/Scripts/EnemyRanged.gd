extends SimpleEnemy

@export var projectile_scene : PackedScene
@export var projectile_spawn : Node2D

func _attack():
	var projectile : Projectile = projectile_scene.instantiate()
	var direction = player.global_position - projectile_spawn.global_position
	spawner.projectiles_parent.add_child(projectile)
	projectile._activate(direction, damage)
	projectile.global_position = projectile_spawn.global_position
	stun = selfstun
	cooldown = attack_cooldown
