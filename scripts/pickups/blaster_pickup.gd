extends Pickup


func _activate_pickup(player : PlayerBase):
	player.weapons[0]._increase_level()

