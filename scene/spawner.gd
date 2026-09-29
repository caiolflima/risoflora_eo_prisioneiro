extends Node3D
@onready var spawn_dado = preload("res://scene/dice.tscn") #endereco da cena do dado
@export var dices: Array
@export var critico: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(_on_signal)

func spawn():
	for i in Dialogic.VAR.Atributos.atributo_escolhido: #multiplica pelo atributo
		var dado = spawn_dado.instantiate()
		add_child(dado)
		dado.global_position = Vector3(-3,14,0)
		dices.append(dado) #coleta os resultados dos dados para a lista

func _on_signal(signal_passed_in):
	if signal_passed_in =="spawn_dices": #spawn ganhou sinal proprio
		spawn()
		AudioManager.play("Roll")
		
	if signal_passed_in =="limpar_resultado": #faz a limpeza das variaveis globais
		Global.lista_resultado_dado = []
		Global.resultado_dado = 0
		critico = 0
		for dado in dices: #faz a limpeza dos dados instanciados 
			if is_instance_valid(dado):
				dado.queue_free()
