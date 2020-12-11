extends Control

onready var scene_tree: = get_tree()
onready var pause_overlay: ColorRect = $PauseOverlay
onready var score: Label = $Label
onready var pause_title: Label = $PauseOverlay/Title
var alive: bool = true

var paused: = false setget set_paused


func _ready() -> void:
	PlayerData.connect("score_updated", self, "update_interface")
	PlayerData.connect("player_died", self, "_on_Player_Data_player_died")
	update_interface()


func _on_Player_Data_player_died() -> void:
	self.paused = true
	pause_title.text = "You died"
	alive = false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause") and alive:
		self.paused = not paused
		#self usado para garantir que o setget vai rodar, visto que
		#alterações dentro de dentro do próprio script não chamam o setget
		scene_tree.set_input_as_handled()


func update_interface() -> void:
	score.text = "Score: %s" % PlayerData.score
	
	
func set_paused(value: bool) -> void:
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value
