extends Node
class_name AnimationManager

@export var animPlayer : AnimationPlayer
@export var sprite : AnimatedSprite2D
@export var movement : PlayerMovement
@export var direction : DirectionManager

var cur_anim : AnimState = AnimState.Enabling

func  _process(_delta):
	pass


enum AnimState{
	Enabling,
	Walk,
	Shutdown,
	Hurt,
	Idle,
	Attack1,
	Attack2,
	Shoot1,
	Shoot2
}
