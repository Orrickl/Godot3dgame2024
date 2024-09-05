extends Button

#define variables
var escape = false
var paused = true


#if a button is pressed
func _input(_event):
	#and that button is escape and the game is running
	if (Input.get_action_strength("escape")!=0 and paused == false):
		escape = true
	if (Input.get_action_strength("escape") == 0) and (escape == true):
		#toggle visibilty and mouse mode
		if (visible == true):
			visible = false
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		elif (visible == false):
			visible = true
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		escape = false
	#if reset pushed remove the menu
	if (Input.get_action_strength("reset")!=0):
		visible = false
		escape = false
		paused = false

#if end zone entered make menu invisible
func _on_Finish_body_entered(_body):
	visible = true
	paused = true


#if start button pressed make menu invisible
func _on_Button_pressed():
	visible = false
	paused = false


#if reset button on  end menu pushed make invisible
func _on_reset_button_pressed():
	visible = false
	paused = false
