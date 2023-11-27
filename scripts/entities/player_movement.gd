extends Area2D

@onready var _screen_size = get_viewport_rect().size
var _base : PlayerBase
var _direction = Vector2.ZERO


func _on_player_ready():
	_base = get_parent()


func _process(delta):
	get_input()
	if _direction != Vector2.ZERO: _base.position += _direction * _base.movement_speed * delta
	else: _base.position = _base.position
	
	var current_position = _base.position 
	current_position.x = clampf(current_position.x, 0, _screen_size.x)
	current_position.y = clampf(current_position.y, 0, _screen_size.y)
	_base.position = current_position


func get_input():
	_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	_direction = _direction.normalized()
