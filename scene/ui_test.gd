extends Node3D
var pronomes: String

func _ready() -> void:
	Global.Nome = Dialogic.VAR.Nome_test
	Global.pronome1 = Dialogic.VAR.pronome1
	Global.pronome2 = Dialogic.VAR.pronome2
	pronomes = Global.pronome1 + ", " + Global.pronome2
	#$Sprite3D/SubViewport/Panel/RichTextLabel.text = ficha.replace("[PLAYER]", Global.Nome)
	$Nome.text = Global.Nome
	$Pronomes.text = pronomes
	Dialogic.signal_event.connect(_on_signal)

func _on_signal(signal_passed_in):
	if signal_passed_in =="mostrar_button":
		$Panel/Button.show()
	if signal_passed_in =="fechar_ficha":
		$".".queue_free()
	
func _on_button_pressed() -> void:
	$".".queue_free()
