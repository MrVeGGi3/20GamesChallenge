extends CharacterBody2D

@onready var look_at_marker_2d: Marker2D = $LookAtMarker2D
@onready var shoot_marker_2d: Marker2D = $ShootMarker2D


@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var respawn_ivencibility_timer: Timer = $RespawnIvencibilityTimer
@onready var spawn_point: Marker2D = $"../SpawnPoint"

const PLAYER_PROJECTILE = preload("res://#4 Asteroids/Assets #4/Scenes/player_projectile.tscn")
const SPEED = 300.0
const ROTATION_SPEED = 1.0

var direction

var screen_size : Vector2
var is_destroyed : bool = false

func _ready() -> void:
	screen_size = get_viewport_rect().size
	

func _physics_process(delta: float) -> void:
	var actual_position = global_transform.origin
	var target_position = look_at_marker_2d.global_transform.origin
	direction = (target_position - actual_position).normalized()
	
	if Input.is_action_pressed("up"):
		velocity += direction * SPEED * delta
		animated_sprite_2d.play("boost")
		
	if Input.is_action_just_released("up"):
		velocity = lerp(velocity, Vector2(0,0), 0.7)
		animated_sprite_2d.play("idle")
	
	move_and_slide()
	
	if Input.is_action_pressed("left"):
		rotation -= ROTATION_SPEED * delta
		animated_sprite_2d.play("idle")
		if Input.is_action_pressed("up"):
			animated_sprite_2d.play("boost")
	elif Input.is_action_pressed("right"):
		rotation += ROTATION_SPEED * delta
		animated_sprite_2d.play("idle")
		if Input.is_action_pressed("up"):
			animated_sprite_2d.play("boost")
	
	if Input.is_action_just_pressed("ui_select"):
		_shoot_project_ast(direction)
		
	if position.x < 0:
		position.x = screen_size.x
	elif position.x > screen_size.x:
		position.x = 0
	
	if position.y < 0:
		position.y = screen_size.y
	elif position.y > screen_size.y:
		position.y = 0	
	
func _shoot_project_ast(dir):
		var instance = PLAYER_PROJECTILE.instantiate()
		get_parent().add_child(instance)
		instance._set_direction(dir)
		if instance.is_inside_tree():
			instance.global_transform.origin = shoot_marker_2d.global_transform.origin

func _life_lose():
	is_destroyed = true
	respawn_ivencibility_timer.start()
	global_transform.origin = spawn_point.global_transform.origin
	

func _on_respawn_ivencibility_timer_timeout() -> void:
	is_destroyed = false

func _get_destroyed():
	return is_destroyed
