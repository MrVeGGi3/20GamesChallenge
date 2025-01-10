class_name Block
extends StaticBody2D

@onready var area_2d: Area2D = $Area2D
@onready var ball = get_tree().get_first_node_in_group("ball")
var speed_add : float = 20.0
func _destroy_block():
	queue_free()
	BreakoutGm.score += 1


func _on_area_2d_body_entered(body: RigidBody2D) -> void:
	_destroy_block()
	ball._add_speed(speed_add)
