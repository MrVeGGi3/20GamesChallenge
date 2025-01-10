extends Area2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var action_name = randi_range(0,2)
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@export var go_left : bool = false
@export var go_right: bool = false
@export var _speed= 100.0
@export var _min_distance_action : float = 40.0



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var player_position = player.position.y
	var actual_position = position.y
	
	var distance_to_player = player_position - actual_position
	
	if distance_to_player <= _min_distance_action:
		_execute_action(action_name)
		print(action_name)
	
	if go_left:
		position.x -= delta * _speed
		animated_sprite_2d.flip_h = false
	elif go_right:
		position.x += delta * _speed
		animated_sprite_2d.flip_h = true
	else:
		_speed = 0.0
		

func _execute_action(action):
	match action:
		0:
			_set_action_(false, false)
		1:
			_set_action_(true, false)
		2:
			_set_action_(false, true)
		_:
			_set_action_(false, false)

func _set_action_(state_1 : bool, state_2 : bool):
	go_left = state_1
	go_right = state_2




func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		queue_free()
		RiverRaidGm.life -= 1




func _on_area_entered(area: Area2D) -> void:
	queue_free()
	area.queue_free()
	RiverRaidGm.score += 100
