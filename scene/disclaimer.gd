extends Control
const menu := "res://scene/Menu.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(_on_signal)
	Dialogic.start("disclaimer")

func _on_signal(signal_passed_in):
	if signal_passed_in =="menu":
		get_tree().change_scene_to_file(menu)
