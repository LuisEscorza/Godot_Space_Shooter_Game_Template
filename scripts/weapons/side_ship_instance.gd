extends Node2D
class_name SideShipInstance

@export var projectile_spawnpoint : Node2D

func set_pos_and_rot(pos, rot):
	set_position(pos)
	set_rotation(rot)
