extends Node2D

@onready var parallax := $Parallax_Ground
var scroll_speed = 0



func _process(delta):
	var offset = parallax.scroll_offset
	offset.x -= Global.scroll_speed * delta
	parallax.scroll_offset = offset
