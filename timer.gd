extends Label

#declare signals to send
signal time(time)
signal finish_time(time)

#declare variables
var time = 0
var timer_on = false
var pressed = false
var paused = true


#on input
func _input(_event):
	#if  input is escape toggle visibilty and whether the timer is on or off
	if (Input.get_action_strength("escape") != 0 and paused == false):
		pressed = true
	if (Input.get_action_strength("escape") == 0) and (pressed == true):
		if (visible == true):
			visible = false
			timer_on = false
			emit_signal("time", time)
		elif (visible == false):
			visible = true
			if (time!=0):
				timer_on = true
		pressed = false


#every frame run this code
func _process(delta):
	#add time  to variable time if timer is on
	if(timer_on):
		time += delta
	#if reset is pushed turn  timer off, reset timer and make visible
	if(Input.get_action_strength("reset") != 0):
		paused = false
		timer_on = false
		time = 0
		visible = true
	#rounding time so that it is to only two decimal places
	time = round(time*100)/100
	#set the text in the label to the time
	text = var2str(time)


#when cross start line turn timer on
func _on_Start_body_entered(_body):
	timer_on = true


#when enter finish line
func _on_Finish_body_entered(_body):
	#emit signal of the current time
	emit_signal("time",time)
	#emit signal 
	emit_signal("finish_time",time)
	#turn  timer off
	timer_on = false
	paused = true


#when reset button pressed
func _on_reset_button_pressed():
	#reset time
	time = 0
	#turn visible
	visible = true
	paused =  false


#when start button pushed
func _on_Button_pressed():
	#turn timer off
	timer_on = false
	#turn visible
	visible = true
	#reset time
	time = 0
	paused = false
