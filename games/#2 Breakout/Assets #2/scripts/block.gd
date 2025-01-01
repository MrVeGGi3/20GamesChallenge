class_name Block
extends StaticBody2D

@onready var area_2d: Area2D = $Area2D


func _destroy_block():
	queue_free()
	BreakoutGm.score += 1


func _on_area_2d_body_entered(body: RigidBody2D) -> void:
	_destroy_block()
