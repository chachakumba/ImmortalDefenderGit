extends CharacterBody2D
class_name Player

static var Instance : Player

@export var ui : PlayerUI

@export var charge : float = 100
@export var drain_speed : float = 1
@export var max_charge : float = 100
@export var min_charge : float = -1

var state : State
signal on_state_change(new_state : State)
signal level_up(level : int)
signal chosen_powerup() # to unfreeze enemies after level up

@export var movement : PlayerMovement
@export var looker : Looker

func _init():
	Instance = self

func _ready():
	_change_state(State.Enabling)

func _get_damage(amount : float):
	print("Got ", amount, " damage")
	charge -= amount
	if charge <= min_charge:
		_shutdown()
	ui._update_charge_slider(charge/max_charge)

func _charge(amount : float):
	charge = clampf(charge + amount, min_charge, max_charge)

func _process(delta):
	charge -= delta * drain_speed
	if charge <= min_charge:
		_shutdown()
	ui._update_charge_slider(charge/max_charge)

func _shutdown():
	printerr("Shutting down")
	charge = max_charge #TODO: remove in release

func _change_state(new_state : State):
	state = new_state
	on_state_change.emit(new_state)

enum State{
	Null,
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
