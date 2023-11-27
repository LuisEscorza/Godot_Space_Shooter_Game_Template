extends Weapon


func _input(event):
	if event.is_action_pressed("ui_accept"):
		is_trigger_pressed = true
		if level > 0: _fire_weapon()
	elif event.is_action_released("ui_accept"):
		is_trigger_pressed = false


func _fire_weapon():
	while is_trigger_pressed:
		if attack_timer >= fire_rate:
			var new_projectiles : Array[ProjectileBase] = [null, null, null, null]
			match amount:
				1:
					new_projectiles[0] = projectile_scene.instantiate()
					new_projectiles[0].set_pos_and_rot(projectile_spawn_points[1].global_position, projectile_spawn_points[1].global_rotation)
					pass_projectile_stats(new_projectiles[0])
					Globals.projectiles_container.call_deferred("add_child", new_projectiles[0])
				2:
					for i in amount:
						match i:
							0: 
								new_projectiles[i] = projectile_scene.instantiate()
								new_projectiles[i].set_pos_and_rot(projectile_spawn_points[1].global_position, projectile_spawn_points[1].global_rotation)
							1:
								new_projectiles[i] = projectile_scene.instantiate()
								new_projectiles[i].set_pos_and_rot(projectile_spawn_points[2].global_position, projectile_spawn_points[2].global_rotation)
						pass_projectile_stats(new_projectiles[i])
						Globals.projectiles_container.call_deferred("add_child", new_projectiles[i])
				_:
					for i in amount:
						new_projectiles[i] = projectile_scene.instantiate()
						new_projectiles[i].set_pos_and_rot(projectile_spawn_points[i].global_position, projectile_spawn_points[i].global_rotation)
						pass_projectile_stats(new_projectiles[i])
						Globals.projectiles_container.call_deferred("add_child", new_projectiles[i])
			AudioManager.play_sfx(fire_audio)
			attack_timer = 0
		await get_tree().process_frame


func _increase_level():
	super._increase_level()
	if is_max_level_reached == false: 
		match level:
			2: increase_fire_rate(0.2)
			3: increase_amount(1)
			4: increase_fire_rate(0.3)
			5: increase_damage_value(4, 0.3)
			6: increase_fire_rate(0.3)
			7: increase_amount(1)
			8: increase_damage_value(10, 0.3)
			9: increase_fire_rate(0.3)
			10: increase_amount(1)
			_: return

