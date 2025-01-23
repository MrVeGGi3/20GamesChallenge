extends Node2D

@onready var path_follow_2d: PathFollow2D = $Path2D/PathFollow2D
@onready var progress_speed : float = 0.01


func _process(delta: float) -> void:
	path_follow_2d.progress_ratio += progress_speed * delta
	
	if path_follow_2d.progress_ratio == 1.0:
		path_follow_2d.progress_ratio -= progress_speed * delta
	elif path_follow_2d.progress_ratio == 0.0:
		path_follow_2d.progress_ratio += progress_speed * delta
