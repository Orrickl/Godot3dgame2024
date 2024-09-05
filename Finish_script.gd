extends Area

#declares variables
var best_score
var score

#declares  signals
signal best(whether_or_not_its_better)


#on receiving finish  time
func _on_timer_lable_finish_time(time):
	if (time != 0):
		score = time
		
		# Specify the path to the file
		var file_path = "res://save_scores.dat"
		
		if (best_score.to_float() > score):
			# Create a File object
			var file = File.new()
			# Open the file for writing
			var error = file.open(file_path, File.WRITE)
			
			if error != OK:
				print("Failed to open file: ", error)
				return
			
			# Write the time to the file
			var number_to_write = score
			file.store_string(str(number_to_write))
			
			# Close the file
			file.close()
			print("Number written to file successfully.")
			
			#send signal as the current score as the best score
			emit_signal("best", score)
			
		else:
			print("not better")
			#send signal of the personal best as the best score
			emit_signal("best", best_score)

#fetches personal best and sets it to pb
func _on_high_score_lable_pb(pb):
	best_score = pb
