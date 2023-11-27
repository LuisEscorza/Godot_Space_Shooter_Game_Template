extends Node2D
class_name Weapon

@export_category("Base Stats")
@export var _base_damage_value : int
@export var _base_fire_rate : float
@export var _base_projectile_speed : float
@export var _base_projectile_scale : Vector2
@export var _base_level : int
@export var max_level : int
@export var projectile_scene : PackedScene
@export var projectile_spawn_points : Array[Marker2D]

# Internal stats
@onready var damage_value : int = _base_damage_value
@onready var fire_rate : float = _base_fire_rate
@onready var projectile_speed : float = _base_projectile_speed
@onready var projectile_scale : Vector2 = _base_projectile_scale
@onready var level : int = _base_level
var amount : int = 1
var attack_timer : float = 1
var is_max_level_reached : bool = false
var is_trigger_pressed : bool = false

@export_category("FX")
@export var fire_audio : AudioStream
@export var hit_audio : AudioStream


# Misc. Functions
func _process(delta):
	attack_timer += delta


func _fire_weapon(): pass


func pass_projectile_stats(projectile: ProjectileBase):
	projectile.set_projectile_stats(projectile_scale, damage_value, projectile_speed, hit_audio)


#Stats modifying functions
func _increase_level():
	if is_max_level_reached == true : return
	
	if level < max_level :
		level += 1
	else : is_max_level_reached = true


func increase_damage_value(value_to_increase: int, size_increase : float):
	damage_value += value_to_increase
	projectile_scale = projectile_scale + Vector2(size_increase, size_increase)


func increase_fire_rate(value_to_increase: float):
	fire_rate -= value_to_increase


func increase_amount(value_to_increase: int):
	amount += value_to_increase







