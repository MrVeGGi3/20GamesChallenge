extends Node2D
@onready var auto_destruction_timer: Timer = $AutoDestructionTimer
@onready var proj_particle: CPUParticles2D = $ProjParticle

const SPEED : float = 1000.00
func _ready() -> void:
	auto_destruction_timer.start()

func _physics_process(delta: float) -> void:
	position.y -= SPEED * delta
	
func _on_auto_destruction_timer_timeout() -> void:
	queue_free()
