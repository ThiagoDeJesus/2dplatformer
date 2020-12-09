extends actor

export var stomp_impulse: = 800.0

func _on_enemy_detector_area_entered(area: Area2D) -> void:
	if velocity.y <= 0:
		return
	velocity = calculate_stomp_velocity(velocity, stomp_impulse)

func _on_enemy_detector_body_entered(body: Node) -> void:
	queue_free()
	
func _physics_process(delta: float) -> void:
	var is_jump_interrupted: = Input.is_action_just_released("jump") and velocity.y < 0.0
	var direction: = get_direction()
	velocity = calculate_move_velocity(velocity, direction, speed, is_jump_interrupted)
	velocity = move_and_slide(velocity, FLOOR_NORMAL)
func get_direction() -> Vector2:
	return Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), 
		-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 1.0)

func calculate_move_velocity(linear_velocity: Vector2, direction: Vector2, speed: Vector2, is_jump_interrupted: bool) -> Vector2:
	var new_velocity: = linear_velocity
	new_velocity.x = speed.x * direction.x
	new_velocity.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		new_velocity.y = speed.y * direction.y
	if is_jump_interrupted:
		new_velocity.y = 0
	#Ctrl + R para alterar palavras em um script
	#Ctrl + Shift + F para alterar palavras em todos os arquivos
	return new_velocity

func calculate_stomp_velocity(linear_velocity: Vector2, stomp_impulse: float) -> Vector2:
		var new_velocity: = linear_velocity
		new_velocity.y = -stomp_impulse
		return new_velocity




