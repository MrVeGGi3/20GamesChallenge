class_name Mario
extends CharacterBody2D

@onready var mario_anim_s2d: AnimatedSprite2D = $CollisionShape2D/MarioAS2D

@export_group("Física do Jogador")
@export var min_velocity = 150.00
@export var max_velocity = 300.0
@export var acceleration_rate = 0.3
@export var jump_velocity = -300.0
const SPEED = 50.00

signal state_changed(state)
signal jump_pressed
signal coin_collide

enum State
{
	IDLE,
	WALKING,
	RUNNING,
	JUMPING,
	DIED
}

enum LifeState
{
	LITTLE,
	BIG,
	FLOWER
}

var current_state = State.IDLE


func _physics_process(delta: float) -> void:
	velocity += get_gravity() * delta
	var direction = Input.get_axis("esquerda", "direita")
	
	if direction:
		velocity.x = lerp(velocity.x, direction * max_velocity, acceleration_rate)
		if is_on_floor():
			if abs(velocity.x) > 0:
				current_state = State.WALKING
			elif abs(velocity.x) > min_velocity:
				current_state = State.RUNNING
	else:
		if is_on_floor():
			velocity.x = lerp(velocity.x, 0.0, acceleration_rate)
			current_state = State.IDLE
			
	if Input.is_action_just_pressed("pular") and is_on_floor():
			velocity.y =  jump_velocity
			current_state = State.JUMPING
			emit_signal("jump_pressed")
			
	move_and_slide()
	emit_signal("state_changed", current_state)

func coinCollide():
	emit_signal("coin_collide")
