extends Node

@export_category("Sources")
@export var sfx_players : Array[AudioStreamPlayer2D]
@export var music_player : AudioStreamPlayer2D


func set_volume(bus_name : String, value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index(bus_name), linear_to_db(value))


func play_music(audio_stream : AudioStream):
	music_player.stream = audio_stream
	music_player.play()


func play_sfx(audio_stream: AudioStream, pitch: float = 1, volume_db: float = 0):
	for player in sfx_players.size():
		if not sfx_players[player].playing:
			sfx_players[player].stream = audio_stream
			sfx_players[player].volume_db = volume_db
			sfx_players[player].pitch_scale = pitch
			sfx_players[player].play()
			return 
