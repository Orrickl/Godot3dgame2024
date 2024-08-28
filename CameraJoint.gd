extends SpringArm

export var mouse_sensitivity := 0.0
var escape = false


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		
			rotation_degrees.x -= event.relative.y * mouse_sensitivity
			rotation_degrees.x = clamp(rotation_degrees.x, -60.0, 0.0)
			
			rotation_degrees.y -= event.relative.x * mouse_sensitivity
			rotation_degrees.y = wrapf(rotation_degrees.y, 0.0, 360.0)


func _on_Button_pressed():
	set_as_toplevel(true)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	mouse_sensitivity = 0.15


func _on_Finish_body_entered(_body):
	mouse_sensitivity = 0
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	


func _on_reset_button_pressed():
	mouse_sensitivity = 0.15
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _on_end_menu_mesh_pressed(_value):
	if (mouse_sensitivity == 0.15):
		mouse_sensitivity = 0
	elif (mouse_sensitivity == 0):
		mouse_sensitivity = 0.15
