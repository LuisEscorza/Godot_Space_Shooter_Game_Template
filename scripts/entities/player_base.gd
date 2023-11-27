extends Entity
class_name PlayerBase


func _ready():
	Globals.set_player(self)

func _take_damage(value: int):
	decrease_health(value)
	if health > 0:
		SignalManager.player_health_changed.emit(health)
	else: _die()


func _die():
	SignalManager.player_died.emit(self)


func heal_up():
	if health < max_health:
		increase_health(1)
		SignalManager.player_health_changed.emit(health)
