extends Node2D
class_name Main

static var Instance : Main

signal on_player_dead

func _init() -> void:
	Instance = self

func _ready():
	print("Initializing")
