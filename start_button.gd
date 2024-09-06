extends Button


#on start button pressed turn invisible
func _on_Button_pressed():
	visible = false


#on exit button pressed turn visible
func _on_exit_button_pressed():
	visible = true
