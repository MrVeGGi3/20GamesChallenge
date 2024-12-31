extends Node2D

var pipe = preload("res://#1 FlappyBird/Assets/scenes/Pipe.tscn")
@export var max_height : float 
@onready var spawn_timer: Timer = $SpawnTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_instantiate_pipe()
	spawn_timer.start()

func _instantiate_pipe():
	var instance = pipe.instantiate()
	get_parent().add_child(instance)
	if instance.is_inside_tree():
		instance.global_transform.origin = Vector2(position.x, randf_range(position.y - max_height, position.y + max_height))		

func _on_spawn_timer_timeout() -> void:
	_instantiate_pipe()
	spawn_timer.start()
