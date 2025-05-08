extends RigidBody2D

const EXPLOSION = preload("res://scenes/Explosion.tscn")


func _on_body_entered(body: StaticBody2D) -> void:
	var instance = EXPLOSION.instantiate()
	instance.global_position = global_position
	get_parent().add_child(instance)
	if instance.is_inside_tree():
		queue_free()
