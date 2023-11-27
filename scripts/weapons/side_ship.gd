extends Weapon

@export var side_ship_scene : PackedScene
@export var side_ship_spawnpoints: Array[Marker2D]
var side_ships: Array[Node2D]


func _input(event):
	if event.is_action_pressed("ui_accept"):
		is_trigger_pressed = true
		if level > 0: _fire_weapon()
	elif event.is_action_released("ui_accept"):
		is_trigger_pressed = false


func _fire_weapon():
	while is_trigger_pressed:
		if attack_timer >= fire_rate:
			var new_projectile : ProjectileBase
			for side_ship in side_ships:
				new_projectile = projectile_scene.instantiate()
				new_projectile.set_pos_and_rot(side_ship.projectile_spawnpoint.global_position, side_ship.global_rotation)
				pass_projectile_stats(new_projectile)
				Globals.projectiles_container.call_deferred("add_child", new_projectile)
			AudioManager.play_sfx(fire_audio)
			attack_timer = 0
		await get_tree().process_frame


func _increase_level():
	super._increase_level()
	if is_max_level_reached == false: 
		match level:
			1: spawn_side_ship(1)
			2: increase_damage_value(1, 0.2)
			3: increase_damage_value(2, 0.2)
			4: spawn_side_ship(2)
			5: increase_fire_rate(0.4)
			6: increase_fire_rate(0.4)
			7: spawn_side_ship(0)
			8: spawn_side_ship(3)
			9: increase_fire_rate(0.3)
			10: increase_damage_value(3, 0.2)
			_: return


func spawn_side_ship(spawn_point_id : int):
	var newShip : SideShipInstance = side_ship_scene.instantiate()
	newShip.set_pos_and_rot(side_ship_spawnpoints[spawn_point_id].position, side_ship_spawnpoints[spawn_point_id].rotation)
	self.call_deferred("add_child", newShip)
	side_ships.append(newShip)
