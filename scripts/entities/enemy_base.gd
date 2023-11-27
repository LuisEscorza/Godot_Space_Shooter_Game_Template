extends Entity
class_name EnemyBase

@export_category("Enemy Settings")
@export var _score_reward : int
@export var pickup_scenes : Array[PackedScene]


func _take_damage(value: int):
	decrease_health(value)
	if health <= 0:
		_die()


func _die():
	SignalManager.enemy_died.emit(_score_reward)
	spawn_powerup()
	queue_free()


func set_pos_and_rot(pos, rot):
	set_position(pos)
	set_rotation(rot)


func spawn_powerup():
	var chance = randi_range(1,100)
	if chance < 45: #spawn something
		chance = randi_range(1,100)
		var new_pickup : Pickup
		if chance > 20:
			chance = randi_range(1,3) 
			new_pickup = pickup_scenes[chance].instantiate() #spawn powerup (1-3)
		else:
			new_pickup = pickup_scenes[0].instantiate() #spawn medkit (0)
		new_pickup.set_pos_and_rot(global_position, global_rotation)
		Globals.pickups_container.call_deferred("add_child", new_pickup)
	else: return #spawn nothing


func _on_area_entered(area):
		if area.get_parent() is PlayerBase:
			area.get_parent()._take_damage(weapons[0].damage_value)
			AudioManager.play_sfx(weapons[0].hit_audio, 1, -1)
			_die()


