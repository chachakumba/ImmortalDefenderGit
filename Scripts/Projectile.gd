extends Node2D
class_name Projectile

var direction : Vector2
var damage : float
@export var speed : float
var hitted_nodes : Array[Node2D] = []
@export var penetration : int = 0

func _activate(new_dir : Vector2, dmg : float, new_penetration : float = 0):
	direction = new_dir.normalized()
	damage = dmg
	penetration = new_penetration

func _process(delta: float) -> void:
	position += direction * delta * speed

func _hit(node : Node2D):
	if hitted_nodes.find(node) > 0:
		return
	
	print("Hitted: ", node)
	hitted_nodes.append(node)
	node._get_damage(damage)
	if penetration < hitted_nodes.size():
		queue_free()
