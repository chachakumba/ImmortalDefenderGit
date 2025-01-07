extends Node

@export var player : AudioStreamPlayer
@export var main_menu_track : AudioStream
@export var music : Array[Music]
var intensity : int = 0
var current_track : int = 0
var current_track_position : float = 0

@export var mute : bool = true

func _ready() -> void:
	player.finished.connect(_next_track)
	music.shuffle()
	_play(music[current_track].tracks[intensity])

func _next_track():
	current_track_position = 0
	current_track += 1
	if current_track == music.size():
		current_track = 0
		music.shuffle()
	_play(music[current_track].tracks[intensity])

func _play(track : AudioStream):
	if mute:
		return
	player.stream = track
	player.play(current_track_position)

func _process(delta : float):
	if Input.is_action_just_pressed("IncreasceIntensity"):
		_increase_intensity()
	current_track_position += delta

func _increase_intensity():
	intensity = clamp(intensity + 1, 0, 2)
	_play(music[current_track].tracks[intensity])
