extends CharacterBody2D
class_name Player

static var Instance : Player

@export var ui : PlayerUI

@export var charge : float = 100
@export var drain_speed : float = 1
@export var max_charge : float = 100
@export var min_charge : float = -1

func _init():
	Instance = self

func _get_damage(amount : float):
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
