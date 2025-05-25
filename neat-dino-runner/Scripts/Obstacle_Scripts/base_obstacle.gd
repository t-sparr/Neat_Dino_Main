extends Node2D
func _process(delta):
	position.x -= Global.scroll_speed * delta
	if position.x < -1000:
		queue_free()
		
func configure():
	for child in get_children():
		if child.get_script() != null:
			if child.has_method("spawn_data"): 
				return child.spawn_data()
				
	push_error("No valid child we spawn_data")		
