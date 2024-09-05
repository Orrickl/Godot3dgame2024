extends SpringArm

#set variables
export var mouse_sensitivity := 0.0
var escape = false

#if theres an input, check if its the reset button and if so put the correct mouse mode on
#or, if its a mouse movement rotate the spring arm within certain bounds
func _unhandled_input(event: InputEvent) -> void:
	#if reset is pushed
	if(Input.get_action_strength("reset")!=0):
		#set cortrect mouse mode
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		#set mouse sensitivity
		mouse_sensitivity = 0.15
	
	#if the mouse has motion
	if event is InputEventMouseMotion:
		
		#rotate the springarm on the x-axis to match the mouse movements 
		rotation_degrees.x -= event.relative.y * mouse_sensitivity
		#set the range of motion the springarm has
		rotation_degrees.x = clamp(rotation_degrees.x, -80.0, 80.0)
		
		#rotate the springarm on the y-axis to match the mouse movements 
		rotation_degrees.y -= event.relative.x * mouse_sensitivity
		#make it so when you rotate more than 360 degrees its the same as setting it  to  0
		rotation_degrees.y = wrapf(rotation_degrees.y, 0.0, 360.0)
	
	#if the  rteset key is  pushed
	if(Input.get_action_strength("reset")!=0):
		#rotate character to be looking straight ahead
		rotation_degrees.x = 0
		rotation_degrees.y = -90


#if start button on main  menu pressed
func _on_Button_pressed():
	#set correct mouse settings
	set_as_toplevel(true)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	mouse_sensitivity = 0.15


#if player enter finish zone
func _on_Finish_body_entered(_body):
	#set correct mouse settings
	mouse_sensitivity = 0
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


#if reset button on end menu pressed
func _on_reset_button_pressed():
	#set correct mouse settings
	mouse_sensitivity = 0.15
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


#
func _on_end_menu_mesh_pressed(_value):
	if (mouse_sensitivity == 0.15):
		mouse_sensitivity = 0
	elif (mouse_sensitivity == 0):
		mouse_sensitivity = 0.15
