extends Node

@onready var mario = get_parent() as Mario
@onready var mario_jump_sound: AudioStreamPlayer = $MarioJumpSound
@onready var coin_collected: AudioStreamPlayer = $CoinCollected
@onready var mario_died: AudioStreamPlayer = $MarioDied
@onready var mario_game_over: AudioStreamPlayer = $MarioGameOver

func _ready() -> void:
	mario.jump_pressed.connect(JumpSound)
	mario.coin_collide.connect(coinSound)
	mario.died.connect(dieSound)
	
func JumpSound():
	mario_jump_sound.play()
	
func coinSound():
	coin_collected.play()
	
func dieSound():
	mario_died.play()


func _on_mario_died_finished() -> void:
	if MarioGameManager.lifes > 0:
		get_tree().reload_current_scene()
	else:
		mario.showGameOver()
		mario_game_over.play()
		
