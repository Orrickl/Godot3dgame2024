extends Label

#declares signals
signal pb(pb)

#declares variables
var saved_time


#on reset pushed turn invisible
func _input(_event):
	if (Input.get_action_strength("reset") != 0):
		visible = false


#on start button pressed turn invisible
func _on_Button_pressed():
	visible = false


#when you enter the end make visible, read a time from  a file then emit  that time
func _on_Finish_body_entered(_body):
	#turn visible
	visible = true
	#declare new file
	var file = File.new()
	#open file to  read
	file.open("res://save_scores.dat", File.READ)
	#save the inisde of the file to a variable
	saved_time = file.get_as_text()
	#emit the time in the variable
	emit_signal("pb", saved_time)
	#close the file
	file.close()


#when button at end screen pressed turn invisible
func _on_reset_button_pressed():
	visible = false


#recieve a signal of the best time and set that as the text
func _on_Finish_best(whether_or_not_its_better):
	text = "your personal best is " + var2str(whether_or_not_its_better)
