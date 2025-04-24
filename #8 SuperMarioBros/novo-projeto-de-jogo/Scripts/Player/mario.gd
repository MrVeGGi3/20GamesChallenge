class_name Mario
extends CharacterBody2D

@onready var mario_anim_s2d: AnimatedSprite2D = $CollisionShape2D/MarioAS2D
@onready var min_velocity = 300.00
@onready var max_velocity = 600.0
@onready var acceleration_rate = 0.5
@onready var jump_velocity = -300.0
const SPEED = 100.00


signal state_changed(state)

enum State
{
	IDLE,
	WALKING,
	RUNNING,
	JUMPING
}

var current_state = State.IDLE


func _physics_process(delta: float) -> void:
	velocity += get_gravity() * delta
	var direction = Input.get_axis("esquerda", "direita")
	
	if is_on_floor():
		if direction:
			velocity.x = lerp(velocity.x, direction * max_velocity, acceleration_rate)
			if abs(velocity.x) > 400:
				current_state = State.WALKING
			else:
				current_state = State.RUNNING
		else:
			velocity.x = lerp(velocity.x, 0.0, acceleration_rate)
			current_state = State.IDLE
			
		if Input.is_action_just_pressed("pular"):
			velocity = Vector2.UP * jump_velocity
			current_state = State.JUMPING
			
	move_and_slide()
	emit_signal("state_changed", current_state)
