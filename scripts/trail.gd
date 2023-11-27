extends Line2D

@export_category('Trail Values')
@export var length : = 10
@export var negative_offset : bool = true

@onready var parent : Node2D = get_parent()
var offset : = Vector2.ZERO


func _ready() -> void:
	if negative_offset:
		offset = -position
	else: offset = position
	top_level = true


func _physics_process(_delta: float) -> void:
	global_position = Vector2.ZERO
	
	var point : = parent.global_position + offset
	add_point(point, 0)
	
	if get_point_count() > length:
		remove_point(get_point_count() - 1)


func on_set_trail_for_clear():
	clear_points()
