extends RigidBody2D

@onready var ball: RigidBody2D = $"."
var first_movement = false
var speed = -500.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _freezed():
	freeze = true
	physics_material_override.bounce = 0

func _move():
	freeze = false
	physics_material_override.bounce = 1
		
func _set_movement():
	linear_velocity.y = speed
	linear_velocity.x = randf_range(-speed, speed)

func _set_position(position : Vector2):
	global_transform.origin = position

func _add_speed(add_speed):
	linear_velocity.y += add_speed
