extends Area2D

var _base : EnemyBase


func _on_enemy_ready():
	_base = get_parent()


func _process(delta):
	_base.position += _base.transform.y *  _base.movement_speed * delta


func _on_on_screen_notifier_screen_exited():
	SignalManager.player_died.emit(Globals.get_player())
	get_parent().queue_free()

