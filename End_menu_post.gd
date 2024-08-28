extends Control

var data_to_send
var timer = 0
onready var http_request = $HTTPRequest


var url = "https://meowfacts.herokuapp.com/"

var json = JSON.data_to_send
var headers = ["Content-Type: application/json"]



func _on_end_menu_mesh_post():
	$HTTPRequest.request(url, headers, HTTPClient.METHOD_POST, json)


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	print(body.get_string_from_utf8())


func _on_timer_lable_time(timer):
	timer 
