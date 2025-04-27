extends Area2D

func _on_body_entered(body: Enemy) -> void:
	body.damagedToDie()
