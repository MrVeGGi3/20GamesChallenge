class_name Worm
extends CharacterBody2D

@export_group("Propriedades")
var life : int 
var speed : int = 400.00

@export_group("Propriedades de Dano")
var weapon_damage: int
@export_range(0, 100, 5)
var force_throw : float 

@export_group("Controle")
var can_attack : bool = false

enum Weapons
{
	EMPTY,
	GRENADE,
	BAZOOKA,
	RIFLE,
}

enum State
{
	DIED, 
	ALIVE
}
@onready var target: TextureRect = $Target
const BULLET = preload("res://scenes/bullet.tscn")


func _ready() -> void:
	target.hide()
	
func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if direction.x:
		velocity = direction.x * speed

func _process(delta: float) -> void:
	if can_attack:
		target.show()
		target.global_position = get_global_mouse_position()
	
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and can_attack:
		if event.button_index == "MOUSE_BUTTON_LEFT" and event.pressed:
			shoot(get_global_mouse_position())
			

func shoot(position):
	var target_position = (position - global_position).normalized()
	if Input.is_action_pressed("shoot"):
		force_throw += 5.0
	if Input.is_action_just_released("shoot"):
		var instance = BULLET.instantiate()
		add_child(instance)
		if instance.is_inside_tree():
			instance.apply_central_force(target_position * force_throw)
			can_attack = false
	
