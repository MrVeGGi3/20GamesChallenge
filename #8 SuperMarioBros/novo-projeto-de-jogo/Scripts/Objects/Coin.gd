extends Area2D

@onready var score_animation = preload("res://Scenes/Animations/ScoreAnimation.tscn")
@onready var coin_score = 10


func _on_body_entered(body: Mario) -> void:
	body.coinCollide()
	MarioGameManager.coins_collected += 1
	MarioGameManager.score += coin_score
	MarioGameManager.instantiateScoreAnimation(score_animation, self, coin_score)
	queue_free()
	

	
	
	
