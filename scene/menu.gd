extends Control
const intro := "res://scene/Intro.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_aceitar_pressed() -> void:
	get_tree().change_scene_to_file(intro)

func _on_recusar_pressed() -> void:
	get_tree().quit()
