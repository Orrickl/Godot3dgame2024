extends Label

var time
var pressed = false

func _input(_event):
	if (Input.get_action_strength("escape")!=0):
		pressed = true
	if (Input.get_action_strength("escape") == 0) and (pressed == true):
		if (visible == true):
			visible = false
		elif (visible == false):
			visible = true
		pressed = false


func _on_Finish_body_entered(_body):
	visible = true


func _on_Button_pressed():
	visible = false


func _on_timer_lable_time(value):
	time = value
	text = "your time is " + var2str(time)


func _on_reset_button_pressed():
	visible = false
