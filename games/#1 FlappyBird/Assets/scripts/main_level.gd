extends Node2D
@onready var score_label: Label = $ScoreLabel
@onready var max_score_label: Label = $MaxScoreLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	FlappyGM.score = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	score_label.text = str(FlappyGM.score)
	max_score_label.text = str(FlappyGM.max_score)
