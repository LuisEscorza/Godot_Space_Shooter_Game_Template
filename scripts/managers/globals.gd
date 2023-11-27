extends Node


var gameplay_manager: GameplayManager
func set_gameplay_manager(node: GameplayManager): gameplay_manager = node
func get_gameplay_manager() -> GameplayManager: return gameplay_manager

var projectiles_container: Node
func set_projectiles_container(node: Node): projectiles_container = node
func get_projectiles_container() -> Node: return projectiles_container

var pickups_container: Node
func set_pickups_container(node: Node): pickups_container = node
func get_pickups_container() -> Node: return pickups_container

var enemies_container: Node
func set_enemies_container(node: Node): enemies_container = node
func get_enemies_container() -> Node: return enemies_container

var player : PlayerBase
func set_player(node: PlayerBase): player = node
func get_player() -> PlayerBase: return player
