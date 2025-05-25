extends Node2D

var spawn_interval = .5
var base_spawn_time = 3


@onready var timer = $"../Timer"
@export var obstacle_scenes: Array[PackedScene] = [
	preload("res://Scenes/Obstacles/saw.tscn"),
	preload("res://Scenes/Obstacles/spike_head.tscn"),
	preload("res://Scenes/Obstacles/block_head.tscn")
]

func _ready():
	timer.wait_time = spawn_interval
	timer.one_shot = true
	timer.start()
	timer.timeout.connect(spawn_obstacle)
	
func spawn_obstacle():
	var obstacle_path = obstacle_scenes.pick_random()
	var instance = obstacle_path.instantiate()
	var instance_spawn_data = instance.configure()
	instance.position = Vector2(700, instance_spawn_data[0])
	timer.wait_time = instance_spawn_data[1] + dynamic_difficulty()  + randf_range(0, .2)
	timer.start()
	add_child(instance)
		
func dynamic_difficulty() -> float:
	var difficulty_step = floor(Global.score / 50)
	var reduction = difficulty_step * .1
	var interval = base_spawn_time - reduction
	interval = clamp(interval, 0, base_spawn_time)
	
	return interval
