extends MeshInstance2D

var pressed = false
signal pressed(value)

func _input(_event):
	if (Input.get_action_strength("escape")!=0) and (pressed == false):
		pressed = true
	if (Input.get_action_strength("escape") == 0) and (pressed == true):
		if (visible == true):
			visible = false
			
		elif (visible == false):
			visible = true
			
		pressed = false
		emit_signal("pressed", pressed)


func _on_Finish_body_entered(_body):
	visible = true


func _on_Button_pressed():
	visible = false


func _on_reset_button_pressed():
	visible = false
