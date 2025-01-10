extends Control


@onready var score_label: Label = $ScoreLabel
@onready var life_label: Label = $LifeLabel
@onready var fuel_progress_bar: ProgressBar = $FuelProgressBar


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fuel_progress_bar.max_value = 100
	fuel_progress_bar.min_value = 0
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	fuel_progress_bar.value = RiverRaidGm.fuel
	score_label.text = str("Score:", RiverRaidGm.score)
	life_label.text = str("Lifes:", RiverRaidGm.life)
