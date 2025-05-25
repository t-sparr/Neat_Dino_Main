extends Node2D

var time_accum = 0
@export var background_scroll_speed := 1.0
@export var scroll_speed := 400
@onready var score_label = $UI/HFlowContainer/Score_Label
@onready var tcp_client = $TCP_Client

func _ready() -> void:
	Global.scroll_speed = scroll_speed
	update_background_speed()
	Global.score = 0
	tcp_client.server_connected.connect(_on_tcp_connected)
	tcp_client.data_received.connect(_on_tcp_data_recieved)
	
func _on_tcp_data_recieved(data):
	pass

func _process(delta: float) -> void:
	time_accum += delta
	if time_accum > .05: 
		Global.score += 1
		update_ui()
		time_accum = 0
		
func _on_tcp_connected():
	var message = {
		"type": "create_population",
		"size": 20,
	}
	tcp_client.send_json(message)
		
func update_background_speed():
	$Background_Environment/Background.material.set_shader_parameter('scroll_speed', background_scroll_speed)		


func update_ui():
	score_label.text = "Score:%d" % Global.score
	
