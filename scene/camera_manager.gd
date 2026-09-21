extends Node3D
const MOUSE_SENSITIVITY = 0.01

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		#global_position += event.relative - funciona de 2d pra 2d, de 2d(mouse) pra 3d usar o abaixo
		global_position.y -= event.relative.x * MOUSE_SENSITIVITY
		global_position.x -= event.relative.y * MOUSE_SENSITIVITY
		print(event.relative)
