extends Area2D

const MEDIUM_METEOR = preload("res://#4 Asteroids/Assets #4/Scenes/MediumMeteor.tscn")
@onready var m_meteor_spawn_marker: Marker2D = $MMeteorSpawnMarker
var speed : float = 100.00
var direction : Vector2
var screen_size

func _ready() -> void:
	screen_size = get_viewport_rect().size
	var x =	randf_range(-1, 1)
	var y = randf_range(-1, 1)
	direction = Vector2(x,y)
	
func _on_body_entered(body: Node2D) -> void:
	if not body._get_destroyed():
		AsteroidsGm.lifes -= 1
		_destroy()
		body._life_lose()
	
func _physics_process(delta: float) -> void:
	position += delta * speed * direction
	
	if position.x < 0:
		position.x = screen_size.x
	elif position.x > screen_size.x:
		position.x = 0
	
	if position.y < 0:
		position.y = screen_size.y
	elif position.y > screen_size.y:
		position.y = 0	
	
	
func _destroy():
	for i in range(2):
		var instance = MEDIUM_METEOR.instantiate()
		instance._set_hit_from_player(true)
		get_parent().add_child(instance)
		if instance.is_inside_tree():
			instance.global_transform.origin = m_meteor_spawn_marker.global_transform.origin	
	queue_free()
