extends Node2D
class_name ProjectileBase

var _damage_value : int
var movement_speed : float
var _body_hit_sound : AudioStream


func set_projectile_stats(_scale: Vector2, damage: int, speed: float, hit_sound : AudioStream):
	%Sprite.scale *= _scale
	%Collider.scale *= _scale
	%Trail.length *=  _scale.x
	%Trail.width *=  _scale.x
	_damage_value = damage
	movement_speed = speed
	_body_hit_sound = hit_sound


func set_pos_and_rot(pos, rot):
	set_position(pos)
	set_rotation(rot)


func _on_area_entered(area):
	if area.is_in_group("damageables"):
		area.get_parent()._take_damage(_damage_value)
		AudioManager.play_sfx(_body_hit_sound)
		queue_for_deletion()


func _take_damage(_dam_value : int):
	queue_for_deletion()


func queue_for_deletion():
	if not is_queued_for_deletion():
		queue_free()


func _on_on_screen_notifier_screen_exited():
	queue_free()




