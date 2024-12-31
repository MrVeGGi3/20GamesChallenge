extends Node2D

@onready var auto_destruction_timer: Timer = $AutoDestructionTimer
@export var velocity : float  = 2.0
@onready var area_2d: Area2D = $Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	auto_destruction_timer.start()

func _physics_process(delta: float) -> void:
	position.x -= velocity
	
	
	
func _on_auto_destruction_timer_timeout() -> void:
	queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		FlappyGM.score += 1
