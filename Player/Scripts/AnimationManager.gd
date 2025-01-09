extends Node
class_name AnimationManager

@export var animPlayer : AnimationPlayer
@export var sprite : Sprite2D
@export var movement : PlayerMovement
@export var looker : Looker
var walk_state : String

func _ready():
	Player.Instance.on_state_change.connect(_change_anim)

func _process(_delta):
	if Player.Instance.state != Player.State.Idle && Player.Instance.state != Player.State.Walk:
		return
	
	if looker.relative_mod_mouse.x >= 0:
		sprite.flip_h = false
	elif looker.relative_mod_mouse.x <= 0:
		sprite.flip_h = true
	
	if movement.move_vector * movement.move_multiplier == Vector2.ZERO:
		return
	
	### It does not make sence. will figure out tomorrow
	if movement.move_vector.x == 0:
		walk_state = "NoInv"
		animPlayer.play("Walk")
		return
	
	if movement.move_vector.x / absf(movement.move_vector.x) == -1 && sprite.flip_h:
		if walk_state == "NoInv":
			return
		animPlayer.play_backwards("Walk")
		walk_state = "NoInv"
	else:
		if walk_state == "Inv":
			return
		animPlayer.play("Walk")
		walk_state = "Inv"

func _change_anim(state : Player.State):
	match state:
		Player.State.Idle:
			animPlayer.play("Idle")
		Player.State.Walk:
			animPlayer.play("Walk")
		Player.State.Hurt:
			animPlayer.play("Hurt")
		Player.State.Attack1:
			animPlayer.play("Attack1")
		Player.State.Attack2:
			animPlayer.play("Attack2")
		Player.State.Shoot1:
			animPlayer.play("Shoot1")
		Player.State.Shoot2:
			animPlayer.play("Shoot2")
		Player.State.Shutdown:
			animPlayer.play("Shutdown")
		Player.State.Enabling:
			animPlayer.play("Enable")
