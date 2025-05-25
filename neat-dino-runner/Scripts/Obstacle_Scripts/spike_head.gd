extends Node
var spawn_pos_y = [135, 80, 30]

func spawn_data():
	var index = randi() % spawn_pos_y.size()
	
	match index:
		0:
			return [spawn_pos_y[index], 1.3]
		1:
			return [spawn_pos_y[index], .8]
		2:
			return [spawn_pos_y[index], .8]
	

@onready var anim_player = $Spike_Animation
@onready var timer = $Timer

func _ready() -> void:
	start_random_timer()
		
func start_random_timer():
	timer.wait_time = randf_range(.2, 5)
	timer.start()
	timer.one_shot = true
	timer.timeout.connect(_on_timer_timeout)

func _on_timer_timeout():
	anim_player.play("Blink")
