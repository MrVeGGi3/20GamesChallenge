class_name GameManager
extends Node

@onready var coins_collected = 0
@onready var score = 0
@onready var lifes = 3

@onready var spawn_point: Marker2D = $SpawnPoint
@onready var height_to_death: Marker2D = $HeightToDeath

@onready var game_over: Control = $GameOver


func instantiateScoreAnimation(scene, object_spawn, score):
	var instance = scene.instantiate()
	get_parent().add_child(instance)
	instance.global_position = object_spawn.global_position
	if instance.is_inside_tree():
		instance.score_label.text = str(score)
		instance.score_animation.play("Score")


	
	
