extends Node2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var ball: RigidBody2D = $Ball
@onready var score_label: Label = $Labels/ScoreLabel
@onready var life_label: Label = $Labels/LifeLabel

func _ready() -> void:
	_set_ball_start_position()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	score_label.text = str(BreakoutGm.score)
	life_label.text = str(BreakoutGm.life)
	
	if ball.position.y > 650.00:
		BreakoutGm.life -= 1
		player.ball_on = true
		_set_ball_start_position()
	

func _set_ball_start_position():
	ball.global_transform.origin = player._get_ball_start_position()
