extends Node3D
const MOUSE_SENSITIVITY = 0.003

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		#global_position += event.relative
		global_position.y -= event.relative.x * MOUSE_SENSITIVITY
		global_position.x -= event.relative.y * MOUSE_SENSITIVITY
		print(event.relative)
