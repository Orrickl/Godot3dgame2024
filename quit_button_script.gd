extends Button


func _on_quit_button_pressed():
	get_tree().quit()


func _on_Button_pressed():
	visible = false


func _on_exit_button_pressed():
	visible = true
