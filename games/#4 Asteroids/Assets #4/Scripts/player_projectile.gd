extends Area2D

var direction 
var screen_size
const SPEED = 500.00
@onready var auto_destruction_timer: Timer = $AutoDestructionTimer
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Meteor"):
		area._destroy()
		AsteroidsGm.score += 100.00

func _ready():
	auto_destruction_timer.start()
	screen_size = get_viewport_rect().size
	audio_stream_player.play()
	

func _physics_process(delta: float) -> void:
	position += direction * SPEED * delta
	
	if position.x < 0:
		position.x = screen_size.x
	
	elif position.x > screen_size.x:
		position.x = 0
	
	if position.y < 0:
		position.y = screen_size.y
	elif position.y > screen_size.y:
		position.y = 0	
	
func _set_direction(direc):
	direction = direc
	
func _on_auto_destruction_timer_timeout() -> void:
	queue_free()
