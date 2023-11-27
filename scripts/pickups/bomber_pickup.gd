extends Pickup


func _activate_pickup(player : PlayerBase):
	player.weapons[1]._increase_level()
