extends Node2D

const GIANT_METEOR = preload("res://#4 Asteroids/Assets #4/Scenes/GiantMeteor.tscn")
@onready var spawn_timer: Timer = $SpawnTimer
@onready var spawn_meteor_point: Marker2D = $SpawnMeteorPoint

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_spawn_meteor()
	spawn_timer.start()
	
func _spawn_meteor():
	var instance = GIANT_METEOR.instantiate()
	get_parent().add_child(instance)
	if instance.is_inside_tree():
		instance.global_transform.origin = spawn_meteor_point.global_transform.origin
		


func _on_spawn_timer_timeout() -> void:
	_spawn_meteor()
	spawn_timer.start()
