class_name Ghost
extends Area2D

enum STATE {IDLE, SCATTER, CHASE, DIED}
var SPEED : float 
var distance_to_player
var anim_spr_2d : AnimatedSprite2D
var current_state = STATE.IDLE

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func change_ghost_state(state):
	current_state = state
	match current_state:
		pass
