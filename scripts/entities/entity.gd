extends Node2D
class_name Entity

@export_category("Health Settings")
@export var _base_health : int
@onready var health : int = _base_health
@onready var max_health : int = _base_health

@export_category("Movement Settings")
@export var _base_movement_speed : float
@onready var movement_speed : float  = _base_movement_speed

@export_category("Weapon Settings")
@export var weapons : Array[Weapon]


func increase_health(value: int):
	health += value


func decrease_health(value: int):
	health -= value


func _take_damage(_value: int): pass


func _die(): pass


func reset_health():
	health = max_health
