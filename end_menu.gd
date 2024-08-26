extends Button

signal escape(escape)

var escape = false

func _input(_event):
	if (Input.get_action_strength("escape")!=0):
		escape = true
	if (Input.get_action_strength("escape") == 0) and (escape == true):
		if (visible == true):
			visible = false
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		elif (visible == false):
			visible = true
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		escape = false




func _on_Finish_body_entered(_body):
	visible = true


func _on_Button_pressed():
	visible = false


func _on_reset_button_pressed():
	visible = false
