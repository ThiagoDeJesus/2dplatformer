extends Area2D

onready var anim_player: AnimationPlayer = $animation_coin

export var score: = 100

func _on_body_entered(body):
	picked()

func picked() -> void:
	PlayerData.score += score
	anim_player.play("fade_out")
