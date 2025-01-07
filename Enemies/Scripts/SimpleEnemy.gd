extends Enemy
class_name SimpleEnemy

@export var speed : float = 100.0
@export var speed_refresh : float = 30.0
var current_speed : float

@export var attack_radius : float

@export var attack_cooldown : float = 3
var cooldown : float = 0
@export var selfstun : float = 0.5
var stun : float = 0

@export var sprite : Node2D

func _init():
	on_damage.connect(_slow_down)

func _physics_process(delta):
	current_speed = clampf(current_speed + speed_refresh, 0, speed)
	if stun > 0:
		stun -= delta
		return
	var direction : Vector2 = player.global_position - global_position
	if direction.x < 0:
		sprite.scale.x = -1
	else:
		sprite.scale.x = 1
	var distance : float = direction.length()
	direction = direction.normalized()
	
	if distance < attack_radius:
		if cooldown > 0:
			cooldown -= delta
			return
		_attack()
		return
	
	velocity = direction * speed
	move_and_slide()

func _slow_down():
	current_speed /= 2

func _attack():
	printerr("Not overriden simple enemy attack")
