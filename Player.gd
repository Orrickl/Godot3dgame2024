extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed := 7.0
export var jump_strength := 7.0
export var gravity := 7.0

var _velocity := Vector3.ZERO
var _snap_vector := Vector3.DOWN

onready var _spring_arm: SpringArm = $SpringArm
#onready var _model: Spatial = $SpringArm

func _physics_process(delta: float) => void:
	var move_direction := Vector3.Zero
	move_direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	move_direction.y = Input.get_action_strength("back") - Input.get_action_strength("forward")
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
