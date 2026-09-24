extends Node3D
@onready var spawn_dado = preload("res://scene/dice.tscn") #endereco da cena do dado
@onready var ficha = preload("res://scene/ui_test.tscn") #endereco da cena do dado
@export var lista_resultado: Array
@export var critico: float
@export var dices: Array

func _ready() -> void:	
	Dialogic.signal_event.connect(_on_signal)
		
func spawn():
	for i in Global.hackear:
		var dado = spawn_dado.instantiate()
		dado.global_position = Vector3(2,14,0)
		add_child(dado)
		dices.append(dado)

func _on_signal(signal_passed_in):
	if signal_passed_in =="spawn_dices": #spawn ganhou sinal proprio
		spawn()
	if signal_passed_in =="coletar_resultado2":
		for i in Global.lista_resultado_dado: #verifica qual foi o maior resultado da lista de dados
			if i > Global.resultado_dado:
				Global.resultado_dado = i
			if i == 6: # verifica quantos 6 foram rolados para resultado critico
				critico = critico + 1
		
		if Global.resultado_dado == 6 and critico >= 2:
			Global.resultado_teste = "Sucesso Crítico"
		elif Global.resultado_dado == 6:
			Global.resultado_teste = "Sucesso Completo"
		elif Global.resultado_dado == 4 or Global.resultado_dado == 5:
			Global.resultado_teste = "Sucesso Parcial"
		elif Global.resultado_dado >=1 or Global.resultado_dado <= 3:
			Global.resultado_teste = "Resultado Ruim"
				
		Dialogic.VAR.resultado_teste = Global.resultado_teste #as variaveis globais retornam valor para as variaveis dialogicc
		Dialogic.VAR.resultado = Global.resultado_dado
	if signal_passed_in =="limpar_resultado": #faz a limpeza das variaveis globais
		Global.lista_resultado_dado = []
		Global.resultado_dado = 0
		critico = 0
		for dado in dices: #faz a limpeza dos dados instanciados 
			if is_instance_valid(dado):
				dado.queue_free()
	if signal_passed_in =="mostrar_ficha":
		var ficha_tutorial = ficha.instantiate()
		ficha_tutorial.global_position = Vector3(2,10,0)
		add_child(ficha_tutorial)

		
		
