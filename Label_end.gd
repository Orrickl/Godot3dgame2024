extends Label


func _on_Finish_body_entered(_body):
	visible = true


func _on_Button_pressed():
	visible = false

func _on_timer_lable_time(value):
	text = var2str(value)
