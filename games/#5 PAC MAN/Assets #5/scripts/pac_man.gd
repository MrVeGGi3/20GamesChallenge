extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0



@onready var anim_spr_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var area_2d: Area2D = $AnimatedSprite2D/Area2D


@onready var wakka_sound: AudioStreamPlayer = $WakkaSound
@onready var death_sound: AudioStreamPlayer = $DeathSound

var screen_size : Vector2 

enum State {IDLE, WALKING, DIED}
var current_state = State.IDLE

func _ready() -> void:
	_change_state(0)
	screen_size = Vector2(1145, 1221)
	
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
	
	
func _process(delta: float) -> void:
	if State.WALKING:
		if not wakka_sound.playing and not death_sound.playing:
			wakka_sound.play()
				
	if position.x < 0:
		position.x = screen_size.x
	elif position.x > screen_size.x:
		position.x = 0
	
	if position.y < 0:
		position.y = screen_size.y
	elif position.y > screen_size.y:
		position.y = 0	
	
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
			death_sound.play()
			anim_spr_2d.play("death")
			print("Pac-Man: Estado de Morte")

func Die():
	if PmGameManager.lifes > 0:
		_change_state(2)
		death_sound.play()
		PmGameManager.lifes -= 1
	else:
		death_sound.play()
		
		
