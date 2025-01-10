extends CharacterBody2D


const SPEED = -300.0
const JUMP_VELOCITY = -400.0
const MAX_SPEED = -600.0
const MIN_SPEED = -150.0

var _can_shoot : bool = true
var _loss_fuel : float = 2.0

const PROJECTILE = preload("res://#3 River Raid/Assets #3/scenes/projectile.tscn")
@onready var player_anim_sprite_2d: AnimatedSprite2D = $PlayerAnimSprite2D
@onready var shoot_timer: Timer = $ShootTimer
@onready var shoot_marker_2d : Marker2D = $ShootMarker2D

func _physics_process(delta: float) -> void:
	position.y += velocity.y * delta
	RiverRaidGm.fuel -= delta * _loss_fuel
	_set_idle_animation()
	
	if Input.is_action_pressed("left"):
		position.x += velocity.y * delta
		_set_turn_animation(false)
		
	if Input.is_action_pressed("right"):
		position.x -= velocity.y * delta
		_set_turn_animation(true)
		
	if Input.is_action_pressed("up"):
		velocity.y = lerp(velocity.y, MAX_SPEED, 0.5)
		_loss_fuel = 4.0
		if Input.is_action_just_released("up"):
			velocity.y = lerp(velocity.y, SPEED, 0.7)
			
			
	elif Input.is_action_pressed("down"):
		velocity.y = lerp(velocity.y, MIN_SPEED, 0.5)
		if Input.is_action_just_released("down"):
			velocity.y = lerp(velocity.y, SPEED, 0.7)
	
	else:
		velocity.y = SPEED
		_loss_fuel = 2.0
		
		
	if _can_shoot:
		if Input.is_action_pressed("ui_select"):
			_instantiate_projectile()
			shoot_timer.start()
			_can_shoot = false

func _instantiate_projectile():
	var instance = PROJECTILE.instantiate()
	get_parent().add_child(instance)
	if instance.is_inside_tree():
		instance.global_transform.origin = shoot_marker_2d.global_transform.origin

func _on_shoot_timer_timeout() -> void:
	_can_shoot = true

func _set_turn_animation(can_turn):
	player_anim_sprite_2d.play("turn")
	player_anim_sprite_2d.flip_h = can_turn

func _set_idle_animation():
	player_anim_sprite_2d.play("idle")

func destroy():
	queue_free()
	
