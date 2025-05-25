extends Node2D

@onready var body = $Body
@onready var animation_body =  $Body/Animation
var gravity = 1300.0
var jump_velocity = -700.0
var current_anim = ""
var in_animation = false

func _ready() -> void:
	setup_visuals()
	
func _process(_delta: float) -> void:
	update_visuals()

func _physics_process(delta: float) -> void:
	body.velocity.y += gravity * delta
	if Input.is_key_pressed(KEY_SPACE) and body.is_on_floor():
		body.velocity.y = jump_velocity
	
	if Input.is_key_pressed(KEY_G) and body.is_on_floor():
		body.velocity.y = jump_velocity * 1.3
		play_anim("Double_Jump")
		
	body.move_and_slide()
		

func setup_visuals():
	play_anim("Run")

func update_visuals():
	if body.velocity.y < 0: play_anim("Jump")
	elif body.velocity.y > 0: play_anim("Fall")
	elif body.is_on_floor(): play_anim("Run")

func play_anim(ani_name: String) -> void:
	if (current_anim != ani_name and current_anim != "Hit" and current_anim != "Double_Jump") or ani_name == "Hit":
		animation_body.play(ani_name)
		current_anim = ani_name
		in_animation = true


#func _on_area_2d_area_entered(area: Area2D) -> void:
	##play_anim("Hit")
	##Global.scroll_speed = 0
	##await get_tree().create_timer(1.2).timeout
	#
	##get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _on_animation_animation_finished() -> void:
	if current_anim == "Double_Jump": current_anim = ""
