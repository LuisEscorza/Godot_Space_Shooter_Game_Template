extends Pickup


func _activate_pickup(player : PlayerBase):
	player.heal_up()
