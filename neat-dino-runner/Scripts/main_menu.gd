extends Control


func _ready() -> void:
	$VBoxContainer/HBoxContainer/Start.pressed.connect(_on_start_pressed)
	$VBoxContainer/HBoxContainer/Quit.pressed.connect(_on_quit_pressed)
	
func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/game.tscn")
	
func _on_quit_pressed():
	get_tree().quit()
	
	
