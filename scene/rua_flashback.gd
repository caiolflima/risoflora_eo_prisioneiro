extends Node3D
@onready var spawn_dado = preload("res://scene/dice.tscn") #endereco da cena do dado
@export var lista_resultado: Array
@export var critico: float
@export var dices: Array
const cadeia := "res://scene/Cadeia.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(_on_signal)
	AudioManager.play("Main") #toca a musica ambiente

func spawn():
	for i in Dialogic.VAR.Atributos.atributo_escolhido: #multiplica pelo atributo
		var dado = spawn_dado.instantiate()
		dado.global_position = Vector3(-3,14,0)
		add_child(dado)
		dices.append(dado) #coleta os resultados dos dados para a lista
		
func _on_signal(signal_passed_in):
	if signal_passed_in =="spawn_dices": #spawn ganhou sinal proprio
		spawn()
		AudioManager.play("Roll")
		
	if signal_passed_in =="coletar_resultado2":
		for i in Global.lista_resultado_dado: #verifica qual foi o maior resultado da lista de dados
			if i > Global.resultado_dado:
				Global.resultado_dado = i
			if i == 6: # verifica quantos 6 foram rolados para resultado critico
				critico = critico + 1
		
		if Global.resultado_dado == 6 and critico >= 2:
			Global.resultado_teste = "Sucesso Completo" #removendo citacao a resultado critico
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
				
		#aqui comeca o tutorial
	if signal_passed_in =="tutorial_abrir":
		$Tutorial.show()
		$"Tutorial/Tutorial Title".show()
		
	if signal_passed_in =="tutorial_abrir1":
		$"Tutorial/Tutorial Title3".show()
	if signal_passed_in =="tutorial_abrir2":
		$"Tutorial/Tutorial Title3".hide()
		$"Tutorial/Tutorial Title4".show()
	if signal_passed_in =="tutorial_fechar":
		$Tutorial.queue_free()
		
	if signal_passed_in =="voltar_cadeia":
		get_tree().change_scene_to_file(cadeia)
		
