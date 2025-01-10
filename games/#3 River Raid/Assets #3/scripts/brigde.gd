extends Node2D

@onready var pass_bridge: Sprite2D = $PassBridge

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_bridge_c_pass_area_body_entered(body: CharacterBody2D) -> void:
	if body.is_in_group("player"):
		body.destroy()
		RiverRaidGm.life -= 1


func _on_bridge_pass_area_body_entered(body : Node2D) -> void:
	if body.is_in_group("player"):
		body.destroy()


func _on_bridge_pass_area_area_entered(area: Area2D) -> void:
	pass_bridge.queue_free()
	area.queue_free()
	RiverRaidGm.add_score(100.0)
