extends Button


#when quit button pressed end the scene
func _on_quit_button_pressed():
	get_tree().quit()


#on start button pressed turn invisible
func _on_Button_pressed():
	visible = false


#on exit button pressed make visible
func _on_exit_button_pressed():
	visible = true
