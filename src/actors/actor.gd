extends KinematicBody2D
class_name actor

export var speed: = Vector2(800.0, 1000.0)
export var gravity: = 3000.0
var velocity: = Vector2.ZERO


func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
