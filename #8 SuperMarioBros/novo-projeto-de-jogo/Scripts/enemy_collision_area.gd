extends Area2D

signal enemy_hitted_to_die

func _physics_process(delta: float) -> void:
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.is_in_group("Enemy"):
			emit_signal("enemy_hitted_to_die")
