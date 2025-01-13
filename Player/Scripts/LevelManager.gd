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
var powerup_panels : Array[PowerupPrefab] = []

@export var exp_speed_mult : float = 1

func _init() -> void:
	Instance = self 

func _ready() -> void:
	level_progress_slider = PlayerUI.Instance.level_progress_slider
	levelup_panel = PlayerUI.Instance.levelup_panel
	for panel in PlayerUI.Instance.powerup_panels:
		powerup_panels.append(panel)


func _process(delta: float) -> void:
	if !started:
		return
	elapsed_time += delta * exp_speed_mult
	level_progress_slider.value = elapsed_time - level * 60
	
	if elapsed_time > (level + 1) * 60:
		_level_up()

func _level_up():
	level += 1
	Player.Instance.on_level_up.emit()
	print("Leveled up")
	print("Panels size: ", powerup_panels.size())
	levelup_panel.visible = true
	pos_powerup_pool.shuffle()
	neg_powerup_pool.shuffle()
	for i in 3:
		print(i + 1, " pow: ", pos_powerup_pool[i].name, ", ", neg_powerup_pool[i].name)
	for pow_pref : PowerupPrefab in powerup_panels:
		print("id: ", pow_pref.id, " pow: ", pos_powerup_pool[pow_pref.id].name, ", ", neg_powerup_pool[pow_pref.id].name)
		pow_pref._bind_pos(pos_powerup_pool[pow_pref.id])
		pow_pref._bind_neg(neg_powerup_pool[pow_pref.id])
	exp_speed_mult = 0

func _powerup_chosen(powerup_scene : PowerupPrefab):
	print("Chosen: ", powerup_scene.pos_powerup.name, ", ", powerup_scene.neg_powerup.name)
	Player.Instance.on_chosen_powerup.emit()
	_remove_pos_powerup(powerup_scene.pos_powerup)
	_remove_neg_powerup(powerup_scene.neg_powerup)
	levelup_panel.visible = false
	exp_speed_mult = 4

func _add_pos_powerup(powerup : Powerup):
	pos_powerup_pool.append(powerup)
func _add_neg_powerup(powerup : Powerup):
	neg_powerup_pool.append(powerup)
func _remove_pos_powerup(powerup : Powerup):
	powerup.amount_in_pool -= 1
	if powerup.amount_in_pool <= 0:
		pos_powerup_pool.erase(powerup)
func _remove_neg_powerup(powerup : Powerup):
	powerup.amount_in_pool -= 1
	if powerup.amount_in_pool <= 0:
		neg_powerup_pool.erase(powerup)
