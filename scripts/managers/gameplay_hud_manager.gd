extends Node
class_name GameplayHUDManager

@export var score_label: Label
@export var fps_label: Label
@export var hp_sprites: Array[Sprite2D]
@export var game_over_audio: AudioStream
@export var game_over_label: Label
@export var pickup_message_label: Label
@onready var fps_timer = %FPSTimer
@onready var pickup_message_timer = %PickupMessageTimer

func _ready():
	SignalManager.powerup_activated.connect(_on_pickup_activated.bind())
	SignalManager.player_health_changed.connect(_on_player_health_changed.bind())
	fps_timer.start()


func _on_fps_timer_timeout():
	fps_label.text = "FPS: " +str(Engine.get_frames_per_second())
	fps_timer.start()


func _on_score_updated(new_score : int):
	score_label.text = "Score:" + str(new_score)


func _on_player_health_changed(new_value: int):
	for i in 3:
		if new_value >= i + 1:
			hp_sprites[i].modulate = Color(1, 1, 1, 1)
		else:
			hp_sprites[i].modulate = Color(0.1, 0.1, 0.1, 0.35)



func _on_pickup_activated(message : String):
	pickup_message_timer.start()
	pickup_message_label.text = message
	pickup_message_label.show()


func _on_pickup_message_timer_timeout():
	pickup_message_label.hide()


func _on_player_died():
	game_over_label.show()
	AudioManager.play_sfx(game_over_audio)
	get_tree().paused = true


func _on_player_player_hurt(current_health):
	_on_player_health_changed(current_health)




