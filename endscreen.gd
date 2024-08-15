extends MeshInstance2D


func _on_Finish_body_entered(_body):
	visible = true


func _on_Button_pressed():
	visible = false
