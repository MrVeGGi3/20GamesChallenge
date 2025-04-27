extends Node

@onready var mario = get_parent() as Mario
@onready var mario_jump_sound: AudioStreamPlayer = $MarioJumpSound
@onready var coin_collected: AudioStreamPlayer = $CoinCollected

func _ready() -> void:
	mario.jump_pressed.connect(JumpSound)
	mario.coin_collide.connect(coinSound)

func JumpSound():
	mario_jump_sound.play()
	
func coinSound():
	coin_collected.play()
