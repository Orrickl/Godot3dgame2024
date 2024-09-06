extends Label

#declares variables
var time
var pressed = false
var paused = true


#on an action toggle visibilty
func _input(_event):
	#if escape pushed toggle visibilty
	if (Input.get_action_strength("escape") != 0 and paused == false):
		pressed = true
	if (Input.get_action_strength("escape") == 0 and pressed == true):
		if (visible == true):
			visible = false
		elif (visible == false):
			visible = true
		pressed = false
	#if reset pushed make invisible
	if (Input.get_action_strength("reset") != 0):
		visible = false
		paused = false


#if end entered make visible
func _on_Finish_body_entered(_body):
	visible = true
	paused = true


#if start button pressed make invisible
func _on_Button_pressed():
	visible = false
	paused = false


#upon receiving signal for time set lable text to time
func _on_timer_lable_time(value):
	time = value
	text = "your time is " + var2str(time)


#when reset is pushed make it invisible
func _on_reset_button_pressed():
	visible = false
	paused = false
