extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var anim_spr_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var area_2d: Area2D = $AnimatedSprite2D/Area2D




enum State {IDLE, WALKING, DIED}
var current_state = State.IDLE

func _ready() -> void:
	_change_state(0)

func _physics_process(delta: float) -> void:
	
	
				
	if Input.is_action_just_pressed("left"):
		_change_state(1)
		rotation_degrees = 0
		anim_spr_2d.flip_h = true
		velocity.x = SPEED * -1
		velocity.y = 0.0

		
	elif Input.is_action_just_pressed("right"):
		_change_state(1)
		rotation_degrees = 0
		anim_spr_2d.flip_h = false
		velocity.x = SPEED
		velocity.y = 0.0
	
	elif Input.is_action_just_pressed("up"):
		_change_state(1)
		rotation_degrees = 90
		anim_spr_2d.flip_h = true
		velocity.y = SPEED * -1
		velocity.x = 0
	
	elif Input.is_action_just_pressed("down"):
		_change_state(1)
		rotation_degrees = 90
		anim_spr_2d.flip_h = false
		velocity.y = SPEED
		velocity.x = 0
		
	move_and_slide()
	

func _change_state(new_state):
	current_state = new_state
	match current_state:
		State.IDLE:
			anim_spr_2d.play("idle")
			velocity.x = 0
			velocity.y = 0
			print("Pac-Man: Estado de Idle")
		State.WALKING:
			anim_spr_2d.play("walking")
			print("Pac-Man: Estado de Walking")
		State.DIED:
			anim_spr_2d.play("death")
			print("Pac-Man: Estado de Morte")
