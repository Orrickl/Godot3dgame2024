extends KinematicBody

#declare variables
export var jump_strength := 35.0
export var speed := 30
export var gravity := 50.0

var playstate := 0
var _velocity := Vector3.ZERO
var _snap_vector := Vector3.DOWN

onready var _spring_arm: SpringArm = $SpringArm
onready var _model: Spatial = $PlayerShape
onready var _starting_position = $start_point.global_translation
onready var _die_position = $die_start.global_translation


#all movement
func _physics_process(delta: float) -> void:
	#if reset pushed change player translation to start position translation
	if(Input.get_action_strength("reset") != 0):
		global_translation = _starting_position
		playstate = 1
	if(playstate == 1):
		#declare vector
		var move_direction := Vector3.ZERO
		#set x of vector to right action strength  - left action strength 
		move_direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
		#set z of vector to back action strength  - forward action strength
		move_direction.z = Input.get_action_strength("back") - Input.get_action_strength("forward")
		move_direction = move_direction.rotated(Vector3.UP, _spring_arm.rotation.y)
		#set velocity to the respective move direction * speed
		_velocity.x = move_direction.x * speed
		_velocity.z = move_direction.z * speed
		
		#set y velocity to velocity - gravity * delta
		_velocity.y -= gravity * delta 
		
		#code for jumping
		var just_landed := is_on_floor() and _snap_vector == Vector3.ZERO
		var is_jumping := is_on_floor() and Input.is_action_just_pressed("jump")
		if is_jumping:
			_velocity.y = jump_strength
			_snap_vector = Vector3.ZERO
		elif just_landed:
			_snap_vector = Vector3.DOWN
		_velocity = move_and_slide_with_snap(_velocity, _snap_vector, Vector3.UP, true)
			
		if _velocity.length() > 0.2:
			var look_direction = Vector2(_velocity.z, _velocity.x)
			_model.rotation.y = look_direction.angle()


#make springarm follow player
func _process(_delta: float) -> void:
	_spring_arm.translation = translation


#put player to start line when they enter the killbox
func _on_Area_body_entered(_body):
	global_translation = _die_position


#when start button pressed move player to the start
func _on_Button_pressed():
	playstate = 1
	global_translation = _starting_position


#when enter end set variable to show that the player is not allowed to move
func _on_Finish_body_entered(_body):
	playstate = 0


#when reset button set variable to show that the player is not allowed to move
#and move character to  the start
func _on_reset_button_pressed():
	playstate = 1
	global_translation = _starting_position


#when end menu visibilty changes toggle playstate
func _on_end_menu_mesh_pressed(_value):
	if (playstate == 0):
		playstate = 1
	elif (playstate == 1):
		playstate = 0
