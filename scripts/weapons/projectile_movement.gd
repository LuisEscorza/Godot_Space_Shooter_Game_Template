extends Area2D
class_name ProjectileMovement

var _base : ProjectileBase


func _on_projectile_ready():
	_base = get_parent()


func _process(delta):
	_base.position += (_base.transform.y * _base.movement_speed * delta)

