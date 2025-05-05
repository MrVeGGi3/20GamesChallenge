class_name Shell
extends Turtle

var target_direction 
@onready var shell_area_2d: Area2D = $ShellArea2D

func _ready() -> void:
	speed = 500.00
	velocity = Vector2.ZERO
	shell_area_2d.monitoring = false
	
func _physics_process(delta: float) -> void:
	selectDirection(current_direction)
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		
		if collider.is_in_group("Wall"):
			changeDirection()
			print("Estou colidindo com o Muro, a direção agora é", current_direction)
		
		elif collider.is_in_group("Mario"):
			shell_area_2d.monitoring = true
			target_direction = collider.velocity.x
			_slide_on_ground()
			mario_hit = true
			print("I make the Shell run")
		
		elif !mario_hit:
			velocity = Vector2.ZERO
			
		#elif collider.is_in_group("Mario") and mario_hit:
			#collider.enemy_collided_to_die()
			
	move_and_slide()

func _slide_on_ground():
	if target_direction > 0:
		current_direction = "Right"
	elif target_direction < 0:
		current_direction = "Left"

func _on_shell_area_2d_body_entered(body: Mario) -> void:
	mario_hit != mario_hit
	shell_area_2d.monitoring = false
	print("Mario hitted on top of Shell")
	if mario_hit:
		_slide_on_ground()
	else:
		velocity = Vector2.ZERO
	
