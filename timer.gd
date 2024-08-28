extends Label
signal time(time)

var time = 0
var timer_on = false

const Save_file = "User://high_scores_file.tres"

var pressed = false

func _input(_event):
	if (Input.get_action_strength("escape")!=0) and (pressed == false):
		pressed = true
	if (Input.get_action_strength("escape") == 0) and (pressed == true):
		if (visible == true):
			visible = false
			timer_on = false
			emit_signal("time", time)
		elif (visible == false):
			visible = true
			timer_on = true
		pressed = false

func _process(delta):
	if(timer_on):
		time += delta
	if(Input.get_action_strength("reset")!=0):
		timer_on = false
		time = 0
	time = round(time*100)/100
	text = var2str(time)

		
	#var file = File.new()
	#file.open("user://" + $timer_lable.text , File.WRITE)
	#file.store_var(time)
	#file.close()


func _on_Start_body_entered(_body):
	timer_on = true


func _on_Finish_body_entered(_body):
	timer_on = false
	emit_signal("time",time)


func _on_reset_button_pressed():
	time = 0
	visible = true


func _on_Button_pressed():
	visible = true
	time = 0
