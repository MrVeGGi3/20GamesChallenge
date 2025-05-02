class_name Mario
extends CharacterBody2D

@onready var mario_anim_s2d: AnimatedSprite2D = $CollisionShape2D/MarioAS2D
@onready var kill_enemy_collision: Area2D = $KillEnemyCollision


@export_group("Física do Jogador")
@export var min_velocity = 150.00
@export var max_velocity = 300.0
@export var acceleration_rate = 0.2
@export var jump_velocity = -300.0
@export var death_jump_velocity = - 400.00
const SPEED = 30.00

@export_group("Sinais")
signal state_changed(state)
signal jump_pressed
signal coin_collide
signal died


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

@onready var game_over: Control = $Camera2D/GameOver

var current_life_state = LifeState.LITTLE
var current_state = State.IDLE

func _ready() -> void:
	get_tree().paused = false
	position = Vector2(39,345)
	set_process_mode(PROCESS_MODE_INHERIT)

func _physics_process(delta: float) -> void:
	velocity += get_gravity() * delta
	var direction = Input.get_axis("esquerda", "direita")
	
	if current_state != State.DIED:
		if direction :
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
			
	if position.y > 382.0:
		Died()
		
	if current_state == State.DIED:
		set_process_mode(PROCESS_MODE_ALWAYS) #Define o Process Mode para executar quando o level estiver pausado
		get_tree().paused = true
		velocity = Vector2(0, death_jump_velocity)
			
	move_and_slide()
	emit_signal("state_changed", current_state)
				

func coinCollide():
	emit_signal("coin_collide")

func Died():
	MarioGameManager.lifes -= 1
	print(MarioGameManager.lifes)
	current_state = State.DIED
	emit_signal("state_changed", current_state)
	emit_signal("died")

func showGameOver():
	set_process_mode(PROCESS_MODE_INHERIT)
	game_over.show()

func enemy_collided_to_die():
	if current_life_state == LifeState.LITTLE:
		Died()
	elif current_life_state == LifeState.BIG:
		current_life_state = LifeState.LITTLE
