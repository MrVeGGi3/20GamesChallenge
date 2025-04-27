extends AnimatedSprite2D

@onready var goomba = get_parent().get_parent() as Goomba
@onready var collision_shape = get_parent()

func _ready() -> void:
	goomba.goomba_change_state.connect(changeAnimGoomba)
	

func changeAnimGoomba(state):
	match state:
		goomba.State.WALKING:
			play("idle")
		goomba.State.DIED:
			play("died")
			collision_shape.disabled = true
			
