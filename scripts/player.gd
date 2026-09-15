extends CharacterBody3D


const SPEED = 3.0
const MOUSE_SENSITIVITY = 0.003
#const TESTE := "res://scene/ambiente2.tscn"

@onready var head: Node3D = $Head
@onready var camera_3d: Camera3D = $Head/Camera3D


func _ready():
	#hide the cursor
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _unhandled_input(event:  InputEvent) -> void:
	# Mouse Look (Only works if captured)
	if event is InputEventMouseMotion \
		and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			# Rotate the whole body left/right (y axis)
			#rotate_y(-event.relative.x * MOUSE_SENSITIVITY)
			
			# Rotate just the head up/down (x axis)
			#head.rotate_x(-event.relative.y * MOUSE_SENSITIVITY)
			
			# Clamp head rotation 
			head.rotation.x = clamp(head.rotation.x, deg_to_rad(-90), deg_to_rad(90))
			head.rotation.y = clamp(head.rotation.y, deg_to_rad(-90), deg_to_rad(90))
	
	if event.is_action_pressed("quit"):
		# Make the mouse visible again
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			
			# Re-Lock the Mouse (Click to capture)
			# If the mouse is visible and we click the left mouse button, capture it again	
	if event is InputEventMouseButton \
		and event.button_index == MOUSE_BUTTON_LEFT \
		and event.pressed:
			if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
				Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
				# We consume the event so we don't accidentally interact/shoot
				# the moment we click to focus]
				get_viewport().set_input_as_handled()
				



func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()


#func _on_area_3d_body_entered(_body: Node3D) -> void:
#	get_tree().change_scene_to_file(TESTE)	


#func _on_area_3d_body_shape_entered(_body_rid: RID, _body: Node3D, _body_shape_index: int, _local_shape_index: int) -> void:
	#get_tree().change_scene_to_file(TESTE)	
