extends Node3D
const TESTE := "res://scene/ambiente2.tscn"
const CADEIA := "res://scene/world.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.start("maintest")


func _on_area_3d_body_shape_entered(_body_rid: RID, _body: Node3D, _body_shape_index: int, _local_shape_index: int) -> void:
	if scene_file_path == "res://scene/ambiente2.tscn":
		#Dialogic.start("morte")
		get_tree().change_scene_to_file(CADEIA)	
	else:
		get_tree().change_scene_to_file(TESTE)	
