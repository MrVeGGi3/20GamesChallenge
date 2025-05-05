class_name Goomba
extends Enemy

@onready var goomba_die_timer: Timer = $DiedTimer
@onready var mario_coliision_area_2d: Area2D = $MarioColiisionArea2D

signal goomba_change_state(state)


func _ready() -> void:
	died_score = 100
	die_timer = goomba_die_timer
	sortDirectionSide()
	selectDirection(current_direction)
	current_state = State.WALKING
	
func _physics_process(delta: float) -> void:
	selectDirection(current_direction)
	emit_signal("goomba_change_state", current_state)
	
	if abs(amount_walked) >= distance_to_walk:
		changeDirection()
		
	
	if current_state == State.DIED:
		velocity = Vector2.ZERO
		
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		
		if collider.is_in_group("Mario"):
			if mario_hit:
				damagedToDie()
			else:
				collider.enemy_collided_to_die()
		
	
		
	move_and_slide()

func _process(delta: float) -> void:
	amount_walked += speed * delta
		
func _on_died_timer_timeout() -> void:
	queue_free()


func _on_mario_coliision_area_2d_body_entered(body: Mario) -> void:
	mario_hit = true
	print("Mario hitted here")
