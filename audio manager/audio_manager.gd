extends Node

var active_musicstream: AudioStreamPlayer

@export_group("Main")
@export_group("Roll")
@export_group("Menu_Riso")
@export_group("Bad_Ending")
@export_group("Flashback")
@export var clips: Node

# Called when the node enters the scene tree for the first time.
func play(audio_name: String, from_position: float = 0.0) -> void:
	active_musicstream = clips.get_node(audio_name)
	active_musicstream.play(from_position)

func stop_music():
	active_musicstream.stop()
