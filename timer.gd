extends Label
signal time(value)

var time = 0
var timer_on = false

const Save_file = "User://high_scores_file.tres"


func _process(delta):
	if(timer_on):
		time += delta
	if(Input.get_action_strength("reset")!=0):
		timer_on = false
		time = 0
	time = round(time*100)/100
	text = var2str(time)
	if (Input.get_action_strength("escape")!=0):
		visible = false
	
	var file = File.new()
	file.open(Save_file, File.WRITE)
	file.store_var(time)
	file.close()


func _on_Start_body_entered(_body):
	timer_on = true


func _on_Finish_body_entered(_body):
	timer_on = false
	emit_signal("time",time)


func _on_reset_button_pressed():
	time = 0


func _on_Button_pressed():
	time = 0
