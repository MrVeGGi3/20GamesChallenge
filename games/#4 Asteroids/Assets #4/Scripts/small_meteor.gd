extends Area2D

var x
var y
var direction = Vector2()
var rotation_speed : float
var speed : float
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	x = randf_range(-0.5, 0.5)
	y = randf_range(-0.5, 0.5)
	speed = randf_range(200.0, 600.00)
	rotation_speed = speed/1000
	direction = Vector2(x,y)
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position += delta * direction * rotation_speed
	
	if position.x < 0:
		position.x = screen_size.x
	elif position.x > screen_size.x:
		position.x = 0
	
	if position.y < 0:
		position.y = screen_size.y
	elif position.y > screen_size.y:
		position.y = 0	
	
func _destroy():
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if not body._get_destroyed():
		AsteroidsGm.lifes -= 1
		_destroy()
		body._life_lose()
	
