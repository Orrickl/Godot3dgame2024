extends Button


var menu_open = false

func _input(event):
	if (menu_open == true):
		visible = false
		menu_open = false
	elif (menu_open == false):
		visible = true
		menu_open = true

func _ready():
	pass


func _on_Finish_body_entered(_body):
	visible = true


func _on_Button_pressed():
	visible = false


func _on_reset_button_pressed():
	visible = false
