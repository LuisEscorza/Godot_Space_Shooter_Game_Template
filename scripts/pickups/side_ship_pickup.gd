extends Pickup


func _activate_pickup(player : PlayerBase):
	player.weapons[2]._increase_level()
