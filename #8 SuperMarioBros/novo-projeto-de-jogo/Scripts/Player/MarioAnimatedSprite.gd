extends AnimatedSprite2D

@onready var mario = get_parent().get_parent() as Mario

func _ready() -> void:
	mario.state_changed.connect(AnimCurrentState)

func _process(delta: float) -> void:
	AnimCurrentState(mario.current_state)

func AnimCurrentState(state):
	match state:
		mario.State.IDLE:
			play("idle_little")
			speed_scale = 1.0
		mario.State.WALKING:
			play("walking_little")
			speed_scale = 1.0
		mario.State.RUNNING:
			play("walking_little")
			speed_scale = abs(mario.velocity.x/mario.min_velocity)
		mario.State.JUMPING:
			play("jumping_little")
			speed_scale = 1.0
			
	if mario.velocity.x > 0:
		flip_h = true
	elif mario.velocity.x < 0:
		flip_h = false
