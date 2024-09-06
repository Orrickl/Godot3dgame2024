extends Label

#when start button pressed go invisible
func _on_Button_pressed():
	visible = false


#when exit button pressed turn visible
func _on_exit_button_pressed():
	visible = true
