class_name Enemy
extends CharacterBody2D


@export_group("Propriedades de Movimento")
@export_range(10,20,1) var distance_to_walk : float
var directions = ["Left", "Right"]
var speed : float = 10.00

@export_group("Propriedades de Armazenamento")
var current_state 
var current_direction : String
var amount_walked : float

var die_timer : Timer 

enum State
{	
	IDLE,
	WALKING,
	FAINTED, 
	DIED
}

func sortDirectionSide():
	current_direction = directions[randi_range(0,1)]

func selectDirection(direction):
	match direction:
		"Left":
			velocity.x = speed * -1
		"Right":
			velocity.x = speed

func changeDirection():
	if current_direction == "Left":
		current_direction = "Right"
		amount_walked = 0.0
	elif current_direction == "Right":
		current_direction = "Right"
		amount_walked = 0.0

func damagedToDie():
	current_state = State.DIED
	die_timer.start()
	
