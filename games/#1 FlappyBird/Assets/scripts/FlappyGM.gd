extends Node

var score : int
var max_score : int


func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if score > max_score:
		max_score = score


func GameOver():
	get_tree().reload_current_scene()
