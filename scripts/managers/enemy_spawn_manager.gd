extends Node
class_name EnemySpawnManager

@export_category("Spawning Settings")
@export var enemy_ship_scenes : Array[PackedScene]
@export var spawn_positions : Array[Marker2D]
@export var spawn_timer: Timer
@export var base_spawning_wait_time : float = 2
@export var is_spawning_enabled : bool = true
var spawning_total_time : int = 0


func _ready():
	spawn_timer.wait_time = base_spawning_wait_time


func set_spawning_wait_time(new_value : float):
	spawn_timer.wait_time = new_value


func start_spawning():
	if is_spawning_enabled:
		spawn_timer.start()


func stop_spawning() :
	spawn_timer.stop()


func _on_score_timer_timeout():
	spawning_total_time += 1
	match spawning_total_time:
		30: base_spawning_wait_time = 2
		70: base_spawning_wait_time = 1
		130: base_spawning_wait_time = 0.5
		_: pass


func _on_spawner_timer_timeout():
	var new_enemy
	var randomID : int = randi_range(0, spawn_positions.size() - 1)
	if spawning_total_time < 30: new_enemy = enemy_ship_scenes[0].instantiate()
	elif spawning_total_time < 60: new_enemy = enemy_ship_scenes[1].instantiate()
	else: new_enemy = enemy_ship_scenes[2].instantiate()
	new_enemy.set_pos_and_rot(spawn_positions[randomID].global_position, spawn_positions[randomID].global_rotation)
	call_deferred("add_child", new_enemy)
	spawn_timer.start()

