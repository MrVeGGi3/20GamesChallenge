extends Area2D

@onready var player = get_tree().get_first_node_in_group("player")
const SPEED = 300.00
@onready var sprite_2d: Sprite2D = $Sprite2D
@export var is_left: bool
	
	
func _physics_process(delta: float) -> void:
	if is_left:
		sprite_2d.flip_h = false
		position.x -= delta * SPEED
	else:
		sprite_2d.flip_h = true
		position.x += delta * SPEED
		
	
	
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		queue_free()
		RiverRaidGm.life -= 1

func _on_area_entered(area: Area2D) -> void:
	queue_free()
	area.queue_free()
	RiverRaidGm.score += 200.00
