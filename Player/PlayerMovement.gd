extends Node2D
class_name PlayerMovement

@export var player_root : CharacterBody2D 

@export var speed = 300.0

var move_vector : Vector2i = Vector2i.ZERO
@export var move_delay : float = 0
var move_multiplier : float = 1

@export var sprite : AnimatedSprite2D

func _physics_process(delta):
	if Input.is_action_just_pressed("Up"):
		_delayed_movement(0,-1)
	if Input.is_action_just_pressed("Down"):
		_delayed_movement(0,1)
	if Input.is_action_just_pressed("Left"):
		_delayed_movement(-1,0)
	if Input.is_action_just_pressed("Right"):
		_delayed_movement(1,0)
	
	if Input.is_action_just_released("Up"):
		_delayed_movement(0,1)
	if Input.is_action_just_released("Down"):
		_delayed_movement(0,-1)
	if Input.is_action_just_released("Left"):
		_delayed_movement(1,0)
	if Input.is_action_just_released("Right"):
		_delayed_movement(-1,0)
	
	if Input.is_action_just_pressed("AddMoveDelay"):
		move_delay += 0.5
	if Input.is_action_just_pressed("DeductMoveDelay"):
		move_delay = clampf(move_delay - 0.5, 0, 1000)
	
	player_root.velocity = move_vector * speed * move_multiplier
	player_root.move_and_slide()

func _delayed_movement(x : int = 0, y : int = 0):
	if move_delay == 0:
		_change_movement_direction(x,y)
	else:
		var movement_timer : MovementTimer = MovementTimer.new()
		movement_timer._delay_movement(move_delay, x, y, self)
		add_child(movement_timer)

func _change_movement_direction(x : int = 0, y: int = 0):
	move_vector.x += x
	move_vector.y += y
