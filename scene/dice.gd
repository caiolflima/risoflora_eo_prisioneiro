extends RigidBody3D

@export var rotation_speed_min: float
@export var rotation_speed_max: float
@export var throw_speed_min: float
@export var throw_speed_max: float
@export var resultado: float
@onready var faces: Node3D = $Faces

signal coletar_resultado2
var start_position: Transform3D
var result_emitted := false

func _ready() -> void:
	start_position = transform
	$".".hide()
	Dialogic.signal_event.connect(_on_signal)
	
	if resultado != 0:
		coletar_resultado2.emit(resultado)
		
	_roll()

func _on_signal(signal_passed_in):
	if signal_passed_in =="ligar_teste":
		$".".show()
		_roll()
	elif signal_passed_in =="coletar_resultado1": #metodo focado em coletar o resultado
		#abaixo - quando o dado para de girar revela o valor:
		if sleeping and not result_emitted: #testando pegar o resultado apenas quando chamado
			_get_result()
			Global.resultado_dado = resultado
			Global.lista_resultado_dado.append(Global.resultado_dado) #enviando o resultado para a variavel global

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("roll"):
		Dialogic.start("nome_jogador_teste")

func _get_result() -> void:
	resultado = _get_rolled_value()
	result_emitted = true
	
func _reset_emitted() -> void:
	result_emitted = false
	
func _roll() -> void:
	_reset_emitted.call_deferred()
	transform = start_position
	rotation = Vector3(randf_range(0, 360), randf_range(0, 360), randf_range(0, 360))
	
	#adiciona a forca de impulso
	var throw_x = randf_range(throw_speed_min, throw_speed_max)
	var throw_y = randf_range(throw_speed_min, throw_speed_max)
	var throw_z = randf_range(throw_speed_min, throw_speed_max)
	apply_impulse(Vector3(throw_x, throw_y, throw_z))
	
	#adiciona a rotacao
	var rotation_x = randf_range(rotation_speed_min, rotation_speed_max)
	var rotation_y = randf_range(rotation_speed_min, rotation_speed_max)
	var rotation_z = randf_range(rotation_speed_min, rotation_speed_max)
	apply_torque_impulse(Vector3(rotation_x, rotation_y, rotation_z))
	

func _get_rolled_value() -> int:
	var best_face = null
	var best_dot = -INF
	
	for face: Face in faces.get_children():
		var normal = face.global_transform.basis.z
		var dot = normal.dot(Vector3.UP)
		
		if dot > best_dot:
			best_dot = dot
			best_face = face.value
	
	return best_face
