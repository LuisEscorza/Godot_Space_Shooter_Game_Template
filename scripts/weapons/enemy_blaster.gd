extends Weapon


func _ready():
	_fire_weapon()


func _fire_weapon():
	await get_tree().create_timer(1).timeout
	while true:
		if attack_timer >= fire_rate:
			var new_projectile : ProjectileBase = projectile_scene.instantiate()
			new_projectile.set_pos_and_rot(projectile_spawn_points[0].global_position, projectile_spawn_points[0].global_rotation)
			pass_projectile_stats(new_projectile)
			Globals.projectiles_container.call_deferred("add_child", new_projectile)
			AudioManager.play_sfx(fire_audio)
			attack_timer = 0
		await get_tree().process_frame
