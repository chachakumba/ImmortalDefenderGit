extends Node
class_name LevelManager

static var Instance : LevelManager
var level : int = 0
@export var started : bool = false
var elapsed_time : float = 0

var level_progress_slider : Slider

@export var pos_powerup_pool : Array[Powerup]
@export var neg_powerup_pool : Array[Powerup]

var levelup_panel : Control
var powerup_panels : Array[PowerupPrefab]

func _init() -> void:
	Instance = self 

func _ready() -> void:
	level_progress_slider = PlayerUI.Instance.level_progress_slider
	levelup_panel = PlayerUI.Instance.levelup_panel
	powerup_panels = PlayerUI.Instance.powerup_panels


func _process(delta: float) -> void:
	if !started:
		return
	elapsed_time += delta
	level_progress_slider.value = elapsed_time - level * 60
	
	if elapsed_time > (level + 1) * 60:
		_level_up()
	

func _level_up():
	Player.Instance.level_up.emit()
	print("Leveled up")
	levelup_panel.visible = true
	pos_powerup_pool.shuffle()
	neg_powerup_pool.shuffle()
	for pow_pref : PowerupPrefab in powerup_panels:
		pow_pref._bind_pos(pos_powerup_pool[pow_pref.id])
		pow_pref._bind_neg(neg_powerup_pool[pow_pref.id])

func _powerup_chosen(powerup_scene : PowerupPrefab):
	Player.Instance.chosen_powerup.emit()
	_remove_pos_powerup(powerup_scene.pos_powerup)
	_remove_neg_powerup(powerup_scene.neg_powerup)
	levelup_panel.visible = false

func _add_pos_powerup(powerup : Powerup):
	pos_powerup_pool.append(powerup)
func _add_neg_powerup(powerup : Powerup):
	neg_powerup_pool.append(powerup)
func _remove_pos_powerup(powerup : Powerup):
	pos_powerup_pool.erase(powerup)
func _remove_neg_powerup(powerup : Powerup):
	neg_powerup_pool.erase(powerup)
