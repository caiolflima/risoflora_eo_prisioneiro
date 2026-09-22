extends Node3D
#@onready var DiceRollerScreen:Node3D = $CanvasLayer/DiceRoller
@onready var spawn_dado = preload("res://scene/dice.tscn") #endereco da cena do dado
@export var lista_resultado: Array
@export var resultado_2: float
@export var critico: float


func _ready() -> void:	
	spawn()
	Dialogic.signal_event.connect(_on_signal)
		
func spawn():
	for i in 3:
		var dado = spawn_dado.instantiate()
		dado.global_position = Vector3(2,14,0)
		add_child(dado)
#func _on_signal(ligar_test):

func _on_signal(signal_passed_in):
	if signal_passed_in =="coletar_resultado2":
		#print(Dice.resultado)
		print("conectou")
		#Global.lista_resultado_dado.append(Global.resultado_dado)
		print(Global.lista_resultado_dado)
		#print(lista_resultado)
		for i in Global.lista_resultado_dado: #verifica qual foi o maior resultado da lista de dados
			if i > Global.resultado_dado:
				Global.resultado_dado = i
			if i == 6: # verifica quantos 6 foram rolados para resultado critico
				critico = critico + 1
		print("valor criticoi", critico)
		
		if Global.resultado_dado == 6 and critico >= 2:
			Global.resultado_teste = "Sucesso Crítico"
		elif Global.resultado_dado == 6:
			Global.resultado_teste = "Sucesso Completo"
		elif Global.resultado_dado == 4 or Global.resultado_dado == 5:
			Global.resultado_teste = "Sucesso Parcial"
		elif Global.resultado_dado >=1 or Global.resultado_dado <= 3:
			Global.resultado_teste = "Resultado Ruim"
				
			
		Dialogic.VAR.resultado_teste = Global.resultado_teste
		Dialogic.VAR.resultado = Global.resultado_dado
	if signal_passed_in =="limpar_resultado":
		Global.lista_resultado_dado = []
		Global.resultado_dado = 0
		critico = 0
