extends Label

var time
var pressed = false
var paused = true

func _input(_event):
	if (Input.get_action_strength("escape")!=0 and paused == false):
		pressed = true
	if (Input.get_action_strength("escape") == 0) and (pressed == true):
		if (visible == true):
			visible = false
		elif (visible == false):
			visible = true
		pressed = false
	if (Input.get_action_strength("reset")!=0):
		visible = false
		paused = false


func _on_Finish_body_entered(_body):
	visible = true
	paused = true


func _on_Button_pressed():
	visible = false
	paused = false


func _on_timer_lable_time(value):
	time = value
	text = "your time is " + var2str(time)


func _on_reset_button_pressed():
	visible = false
	paused = false
