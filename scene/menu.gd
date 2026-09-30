extends Control
const intro := "res://scene/Intro.tscn"
const creditos := "res://scene/Credits.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AudioManager.play("Menu_Riso") #toca a musica de menu

func _on_aceitar_pressed() -> void:
	get_tree().change_scene_to_file(intro)

func _on_creditos_pressed() -> void:
	get_tree().change_scene_to_file(creditos)

func _on_recusar_pressed() -> void:
	get_tree().quit()
