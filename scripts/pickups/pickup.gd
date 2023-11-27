extends Area2D
class_name Pickup
## Too simple to divide into components.

@export_category("Powerup Settings")
@export var _speed : float
@export var _pickup_sound : AudioStream
@export var _pickup_message : String


func _process(delta):
	position += transform.y *  _speed * delta


func set_pos_and_rot(pos, rot):
	set_position(pos)
	set_rotation(rot)


func _activate_pickup(_player : PlayerBase): pass


func _on_area_entered(area):
	if area.get_parent() is PlayerBase:
		_activate_pickup(area.get_parent())
		AudioManager.play_sfx(_pickup_sound)
		SignalManager.emit_signal("powerup_activated", _pickup_message)
		queue_free()


func _on_on_screen_notifier_screen_exited():
	queue_free()
