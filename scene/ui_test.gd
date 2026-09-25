extends Node3D
var pronomes: String
var ficha: String = "ID: 1312
NOME: [PLAYER]
PRONOME: [PRONOMES]

DELITOS:
- Pirataria no ciberespaço;
- Estelionato Digital e Fraude Eletrônica;
- Invasão de Dispositivo Eletrônico Alheio;
- Evasão de trabalho externo
- Evasão por quebra de vigilância;

HABILIDADES NOTÁVEIS:
Hackear : [x ] [ x] [ ] [ ] — (Invadir redes eletrônicas, burlar criptografia ou programar sistemas)
Detonar: [ x] [ ] [ ] [ ] — (Correr, escalar, saltar ou conduzir veículos terrestres)
Esgueirar : [ x] [ ] [ ] [ ] — (Mover-se furtivamente, esconder-se ou agir sem ser detectado)
Lutar : [ x] [ ] [ ] [ ] — (Combate corporal, tiroteios de curto alcance ou confrontos diretos)
Gingar : [ x] [ x] [ ] [ ] — (Mentir, blefar, seduzir ou persuadir com charme)
Socializar: [ x] [ x] [ ] [ ] — (Conversar com contatos, obter boatos ou misturar-se em festas)
"

func _ready() -> void:
	Global.Nome = Dialogic.VAR.Nome_test
	Global.pronome1 = Dialogic.VAR.pronome1
	Global.pronome2 = Dialogic.VAR.pronome2
	pronomes = Global.pronome1 + ", " + Global.pronome2
	ficha = ficha.replace("[PLAYER]", Global.Nome)
	#$Sprite3D/SubViewport/Panel/RichTextLabel.text = ficha.replace("[PLAYER]", Global.Nome)
	$RichTextLabel.text = ficha.replace("[PRONOMES]", pronomes)
	Dialogic.signal_event.connect(_on_signal)

func _on_signal(signal_passed_in):
	if signal_passed_in =="mostrar_button":
		$Panel/Button.show()
	if signal_passed_in =="fechar_ficha":
		$".".queue_free()
	
func _on_button_pressed() -> void:
	$".".queue_free()
