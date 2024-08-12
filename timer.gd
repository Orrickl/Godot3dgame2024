extends Label

var time = 0
var timer_on = false



func _process(delta):
	if(timer_on):
		time += delta
		text = var2str(round(time*100)/100)
	if(Input.get_action_strength("reset")!=0):
		time = 0

func _on_Start_body_entered(_body):
	timer_on = true


func _on_Finish_body_entered(_body):
	timer_on = false
	
	

func _on_Area_body_entered(body):
	timer_on = false
