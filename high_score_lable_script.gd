extends Label

signal pb(pb)

var content


func _input(_event):
	if (Input.get_action_strength("reset")!=0):
		visible = false


func _on_Button_pressed():
	visible = false


func _on_Finish_body_entered(_body):
	visible = true
	var file = File.new()
	file.open("res://save_scores.dat", File.READ)
	content = file.get_as_text()
	print("setting lable")
	emit_signal("pb", content)
	file.close()


func _on_reset_button_pressed():
	visible = false


func _on_Finish_best(whether_or_not_its_better):
	text = "your personal best is " + var2str(whether_or_not_its_better)
