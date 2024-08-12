extends SpringArm

export var mouse_sensitivity := 0

var playing := false


func _ready() -> void:
	if(playing):
		set_as_toplevel(true)
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		print("HI")
	


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotation_degrees.x -= event.relative.y * mouse_sensitivity
		rotation_degrees.x = clamp(rotation_degrees.x, -60.0, 0.0)
		
		rotation_degrees.y -= event.relative.x * mouse_sensitivity
		rotation_degrees.y = wrapf(rotation_degrees.y, 0.0, 360.0)

func _on_Button_pressed():
	playing = true
	mouse_sensitivity = 0.05
