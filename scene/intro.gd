extends Control
const cadeia := "res://scene/Cadeia.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Aviso2.hide()
	$Aviso3.hide()
	Dialogic.signal_event.connect(_on_signal)

func _on_aceitar_pressed() -> void:
	$Aceitar.hide()
	$Recusar.hide()
	$Aviso1.hide()
	Dialogic.start("Intro")


func _on_recusar_pressed() -> void:
	pass # Replace with function body.

func _on_signal(signal_passed_in):
	if signal_passed_in =="citacao1":
		$Aviso2.show()
	if signal_passed_in =="titulo":
		$Aviso2.hide()
		$Aviso3.show()
	if signal_passed_in =="iniciar":
		$Aviso3.hide()
	if signal_passed_in =="iniciar2":
		get_tree().change_scene_to_file(cadeia)
