class_name ScreenOverlay
extends Node2D

@export var color: Color

func _draw():
	var camera_rect := get_viewport_rect()*get_canvas_transform()
	draw_rect(Rect2(
		camera_rect.position.x - 64,
		camera_rect.position.y - 64,
		camera_rect.size.x + 128,
		camera_rect.size.y + 128
	), color)

func _process(_delta):
	queue_redraw()
