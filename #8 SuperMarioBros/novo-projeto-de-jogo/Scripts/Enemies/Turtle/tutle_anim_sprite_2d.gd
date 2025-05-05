extends AnimatedSprite2D

@onready var turtle = get_parent().get_parent() as Turtle


func _ready() -> void:
	turtle.turtle_change_state.connect(changeTurtleAnim)
	

func changeTurtleAnim(direction):
	play("idle")
	if direction == "Left":
		flip_h = false
	elif direction == "Right":
		flip_h = true
		
	
