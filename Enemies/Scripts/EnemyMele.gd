extends SimpleEnemy
@export var attack_visual : Node2D

func _attack():
	print("Attacking")
	player._get_damage(damage)
	attack_visual.visible = true
	stun = selfstun
	cooldown = attack_cooldown
	await get_tree().create_timer(selfstun).timeout
	attack_visual.visible = false
