extends Node
class_name MovementTimer

var x: int
var y :int
var time_left : float
var movement : PlayerMovement

func _delay_movement(time : float, nx : int, ny : int, nmovement : PlayerMovement):
	time_left = time
	x = nx
	y = ny
	movement = nmovement

func _process(delta):
	time_left -= delta
	if time_left > 0:
		return
	
	movement._change_movement_direction(x,y)
	queue_free()
