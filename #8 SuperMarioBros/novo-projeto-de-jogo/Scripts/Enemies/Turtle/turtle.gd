class_name Turtle
extends Enemy

@onready var shell_turtle = preload("res://Scenes/Enemies/Shell.tscn")

signal turtle_change_state(direction)

func  _ready() -> void:
	died_score = 200
	sortDirectionSide()
	distance_to_walk = 30.0
	current_state = State.WALKING
	
func _physics_process(delta: float) -> void:
	selectDirection(current_direction)
	emit_signal("turtle_change_state", current_direction)
	
	if abs(amount_walked) > distance_to_walk and current_state == State.WALKING:
		changeDirection()
	
	if current_state == State.FAINTED:
		velocity = Vector2.ZERO
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		
		if collider.is_in_group("Mario"):
			if mario_hit and current_state == State.WALKING:
				MarioGameManager.instantiateScoreAnimation(score_animation, self, died_score)
				current_state = State.DIED
				mario_hit = false
				instantiateShell()
		
	move_and_slide()

func _process(delta: float) -> void:
	amount_walked += speed * delta
	

func _on_turtle_hit_area_2d_body_entered(body: Mario) -> void:
	mario_hit = true

func instantiateShell():
	var instance = shell_turtle.instantiate()
	instance.global_position = global_position
	get_parent().add_child(instance)
	if instance.is_inside_tree():
		queue_free() 
