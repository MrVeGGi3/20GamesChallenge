extends Area2D

@export var fuel_amount_increment : float = 10.0
@export var score_amount_increment : float = 200.0

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		RiverRaidGm.add_fuel(fuel_amount_increment)
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	RiverRaidGm.add_score(score_amount_increment)
	area.queue_free()
	queue_free()
