extends "res://src/actors/actor.gd"

export var score: = 100

func _ready() -> void:
	set_physics_process(false)
	velocity.x = -speed.x

func _on_stomp_detector_body_entered(body: Node) -> void:
	if body.global_position.y > $stomp_detector.global_position.y:
		return
	$collision_enemy.disabled = true
	die()

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	if is_on_wall():
		velocity.x *= -1.0
	velocity.y = move_and_slide(velocity, FLOOR_NORMAL).y
	
func die() -> void:
	queue_free()
	PlayerData.score += score


