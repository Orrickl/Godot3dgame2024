extends Label

var time = 0
var timer_on = false

func _process(delta):
	if(timer_on):
		time += delta
		text = var2str(round(time*100)/100)
		print("hi")
	 #if(not timer_on):
		

func _on_Start_body_entered(_body):
	timer_on = true



func _on_Finish_body_entered(_body):
	timer_on = false

