extends Node2D

@onready var player = get_tree().get_first_node_in_group("player")
const ENEMY_PLANE = preload("res://#3 River Raid/Assets #3/scenes/Enemy_plane.tscn")
var _min_distance_spawn : float = 40.0
@onready var spawner_point: Marker2D = $SpawnerPoint
var can_spawn = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var _actual_position = position.y
	var _player_position = player.position.y
	var _dist_to_player = _player_position - _actual_position
	if _dist_to_player <= _min_distance_spawn:
		if can_spawn:
			_instantiate_airplane()
			can_spawn = false
		

func _instantiate_airplane():
	var instance = ENEMY_PLANE.instantiate()
	instance.is_left = true
	get_parent().add_child(instance)
	if instance.is_inside_tree():
		instance.global_transform.origin = spawner_point.global_transform.origin
