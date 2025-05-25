@tool
extends EditorPlugin

var timer: Timer

func _enter_tree():
	timer = Timer.new()
	timer.wait_time = 60  # seconds
	timer.one_shot = false
	timer.autostart = true
	timer.name = "AutoSaverTimer"
	timer.timeout.connect(_on_timeout)
	add_child(timer)

func _exit_tree():
	if timer:
		timer.stop()
		timer.queue_free()

func _on_timeout():
	var editor = get_editor_interface()
	var scene = editor.get_edited_scene_root()
	if scene:
		editor.save_scene()
		print("~autosaved at:", Time.get_datetime_string_from_system())
