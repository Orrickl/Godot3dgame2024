extends MeshInstance2D

#declare variables
var paused = true
var pressed = false

#declare signals
signal pressed(value)
signal post()


#if a button is pushed 
func _input(_event):
	#toggle menu visibility
	if (Input.get_action_strength("escape") != 0 and paused == false):
		pressed = true
	if (Input.get_action_strength("escape") == 0) and (pressed == true):
		if (visible == true):
			visible = false
		elif (visible == false):
			visible = true
		pressed = false
		#emit signal about pressed signal
		emit_signal("pressed", pressed)
	#if reset pushed make menu invisible
	if (Input.get_action_strength("reset") != 0):
		visible = false
		paused = false
	

#on end  area entered make visible
func _on_Finish_body_entered(_body):
	visible = true
	emit_signal("post")
	paused = true

#on start menu button pressed make invisible
func _on_Button_pressed():
	visible = false
	paused = false

#on reset pushed make invisible
func _on_reset_button_pressed():
	visible = false
	paused = false
