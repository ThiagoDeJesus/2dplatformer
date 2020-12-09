extends Area2D

onready var anim_player: AnimationPlayer = $animation_coin

func _on_body_entered(body):
	anim_player.play("fade_out")
