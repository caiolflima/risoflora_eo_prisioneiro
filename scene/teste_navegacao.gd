extends Node3D
@onready var DiceRollerScreen:Node3D = $CanvasLayer/DiceRoller

#func _on_dice_roller_visibility_changed() -> void:
#	if ligar_test == true:
#		DiceRollerScreen.open_screen();

func _ready() -> void:
	Dialogic.signal_event.connect(_on_signal)
	_on_signal("ligar_test") #liga a visibilidade do dado
	
func _on_signal(ligar_test):
	DiceRollerScreen.visible = true;
	
	
