class_name Goomba
extends Enemy

@onready var goomba_die_timer: Timer = $DiedTimer
signal goomba_change_state(state)

func _ready() -> void:
	die_timer = goomba_die_timer
	sortDirectionSide()
	selectDirection(current_direction)
	current_state = State.WALKING
	
func _physics_process(delta: float) -> void:
	amount_walked += speed * delta
	if amount_walked >= distance_to_walk:
		changeDirection()
	
	if current_state == State.DIED:
		velocity = Vector2.ZERO
		
	move_and_slide()
		
func _on_died_timer_timeout() -> void:
	queue_free()
