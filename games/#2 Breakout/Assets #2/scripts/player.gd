extends Node2D

@export var SPEED = 10
@export var initial_force = -10
@export var ball_on : bool = true

@onready var ball: RigidBody2D = $"../Ball"
@onready var ball_start_position: Marker2D = $BallStartPosition


func _physics_process(delta: float) -> void:
	var marker_position = ball_start_position.global_transform.origin
	if Input.is_action_pressed("left"):		
		position.x -= SPEED
	if Input.is_action_pressed("right"):
		position.x += SPEED
		
	if ball_on == true:
		ball._freezed()
		if Input.is_action_just_pressed("ui_select"):
			ball._set_movement()
			ball_on = false
		ball._set_position(marker_position)
	else:
		ball._move()

func _get_ball_start_position():
	return ball_start_position.global_transform.origin
