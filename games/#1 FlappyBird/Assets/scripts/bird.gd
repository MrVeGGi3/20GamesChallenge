extends RigidBody2D

const JUMP_VELOCITY = -400.0
@onready var bird: RigidBody2D = $"."
@onready var is_game_over = false

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_select"):
		linear_velocity.y = JUMP_VELOCITY
	var bodies = bird.get_colliding_bodies()
	for body in bodies:
		if body.is_in_group("pipe"):
			FlappyGM.GameOver()
		if body.is_in_group("ground"):
			FlappyGM.GameOver()
