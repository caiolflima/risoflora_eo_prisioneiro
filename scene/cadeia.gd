extends Node3D
@onready var ficha = preload("res://scene/ui_test.tscn") #endereco da cena da ficha

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Dialogic.start("capitulo1")
	Dialogic.signal_event.connect(_on_signal)
	AudioManager.play("Main") #toca a musica ambiente
	$Alicate.hide()
	$Galego.hide()
	$Iluminacao/SpotLight_bandidos.hide()
	
func _on_signal(signal_passed_in):
	if signal_passed_in =="mostrar_ficha":
		var ficha_tutorial = ficha.instantiate()
		ficha_tutorial.global_position = Vector3(2,10,0)
		add_child(ficha_tutorial)
		print("Ficha")

	if signal_passed_in =="acordar_presos":
		$Iluminacao/SpotLight_bandidos.show()
		$Alicate.show()
		$Galego.show()
