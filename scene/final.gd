extends Control
const menu := "res://scene/Menu.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(_on_signal)

func _on_signal(signal_passed_in):
	if signal_passed_in =="final_marcado":
		$Final_Marcado.show()
		$Final_Bom.hide()
		$Final_Ruim.hide()
	if signal_passed_in =="final_bom":
		$Final_Bom.show()
		$Final_Marcado.hide()
		$Final_Ruim.hide()
	if signal_passed_in =="final_ruim":
		$Final_Ruim.show()
		$Final_Bom.hide()
		$Final_Marcado.hide()
	if signal_passed_in =="menu":
		get_tree().change_scene_to_file(menu)
