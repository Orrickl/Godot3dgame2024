extends Area
var best_score
var score

signal best(whether_or_not_its_better)

func _on_timer_lable_finish_time(time):
	if (time != 0):
		score = time
		
		# Specify the path to the file
		var file_path = "res://save_scores.dat"
		
		if (best_score.to_float() > score):
			# Create a File object
			var file = File.new()
			# Open the file for writing (create it if it doesn't exist, or overwrite it if it does)
			var error = file.open(file_path, File.WRITE)
			
			if error != OK:
				print("Failed to open file: ", error)
				return
			
			# Write a number to the file
			var number_to_write = score
			file.store_string(str(number_to_write))
			
			# Close the file
			file.close()

			print("Number written to file successfully.")
			emit_signal("best", score)
			
		else:
			print("not better")
			emit_signal("best", best_score)


func _on_high_score_lable_pb(pb):
	best_score = pb
