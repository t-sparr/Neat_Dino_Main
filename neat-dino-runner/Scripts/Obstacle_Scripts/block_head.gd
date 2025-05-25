extends Node2D

var spawn_pos_y = 120

var min_interval = 1.6

@onready var anim_player = $AnimatedSprite2D
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
func spawn_data():
	return [spawn_pos_y, min_interval]
