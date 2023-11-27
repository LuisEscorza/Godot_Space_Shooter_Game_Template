extends Node
class_name GameplayManager
signal score_increased(score)
signal player_died
signal game_started

@export_category("Spawn")
@export var projectiles_container : Node
@export var enemies_container : Node
@export var pickups_container : Node

@export_category("Misc")
@export var score_timer : Timer
var gameplay_time : int = 0
var score : int = 0


func _ready():
	Globals.set_gameplay_manager(self)
	Globals.set_projectiles_container(projectiles_container)
	Globals.set_enemies_container(enemies_container)
	Globals.set_pickups_container(pickups_container)
	SignalManager.enemy_died.connect(_on_enemy_died.bind())
	SignalManager.player_died.connect(_on_player_died.bind())
	score_timer.start()
	game_started.emit()


func _on_enemy_died(score_reward):
	increase_score(score_reward)


func _on_score_timer_timeout():
	increase_score(1)
	score_timer.start()


func increase_score(amount : int):
	score += amount
	score_increased.emit(score)


func _on_player_died(player):
	player.queue_free()
	score_timer.stop()
	player_died.emit()
