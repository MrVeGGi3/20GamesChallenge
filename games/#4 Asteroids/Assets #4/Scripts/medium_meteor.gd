extends Area2D

var is_hit_from_player : bool = false
var x
var y
var direction = Vector2()
var rotation_speed : float
var speed : float
var screen_size 
@onready var marker_2d: Marker2D = $Marker2D





# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if is_hit_from_player:
		x = randf_range(-1,1)
		y = randf_range(-1,1)
		speed = randf_range(100.0, 400.0)
		rotation_speed = speed/1000
		direction = Vector2(x,y)
	
	screen_size = get_viewport_rect().size
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position += speed * delta * direction
	rotation += rotation_speed
	
	if position.x < 0:
		position.x = screen_size.x
	elif position.x > screen_size.x:
		position.x = 0
	
	if position.y < 0:
		position.y = screen_size.y
	elif position.y > screen_size.y:
		position.y = 0	

func _set_hit_from_player(value : bool):
	is_hit_from_player = value


	
func _destroy():
	queue_free()
	


func _on_body_entered(body: Node2D) -> void:
	if not body._get_destroyed():
		AsteroidsGm.lifes -= 1
		_destroy()
		body._life_lose()
	
