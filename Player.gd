extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var jump_strength := 30.0
export var speed := 30
export var gravity := 50.0

var playstate := 0
var _velocity := Vector3.ZERO
var _snap_vector := Vector3.DOWN

onready var _spring_arm: SpringArm = $SpringArm
onready var _model: Spatial = $PlayerShape
onready var _starting_position = $Start.global_translation
onready var _die_position = $die_start.global_translation


func _physics_process(delta: float) -> void:
	if(Input.get_action_strength("reset")!=0):
		global_translation = _starting_position
		playstate = 1
	if(playstate==1):
		var move_direction := Vector3.ZERO
		move_direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
		move_direction.z = Input.get_action_strength("back") - Input.get_action_strength("forward")
		move_direction = move_direction.rotated(Vector3.UP, _spring_arm.rotation.y)
			
		_velocity.x = move_direction.x * speed
		_velocity.z = move_direction.z * speed
			
		_velocity.y -= gravity * delta 
			
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
			


func _process(_delta: float) -> void:
	_spring_arm.translation = translation

func _on_Area_body_entered(_body):
	global_translation = _die_position


func _on_Button_pressed():
	playstate = 1
	global_translation = _starting_position

func _on_Finish_body_entered(_body):
	playstate = 0

func _on_reset_button_pressed():
	playstate = 1
	global_translation = _starting_position


func _on_end_menu_mesh_pressed(_value):
	if (playstate == 0):
		playstate = 1
	elif (playstate == 1):
		playstate = 0
