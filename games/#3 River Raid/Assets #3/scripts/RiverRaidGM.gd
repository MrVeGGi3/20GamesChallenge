extends Node

var score : int
var life : int = 3
var fuel : float = 100.00

func add_fuel(amount : float):
	fuel += amount

func add_score(amount : float):
	score += amount
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
