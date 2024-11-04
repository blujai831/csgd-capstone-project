class_name Brazier
extends AnimatedSprite2D

@onready var _area := $'Area2D' as Area2D
@onready var _level := $'..' as Level

func _ready():
	_area.body_entered.connect(_on_area_body_entered)
	play(&'default')

func _on_area_body_entered(body: Node2D):
	if body is PlayerCharacter:
		if body.heldItem and (body.heldItem is Candle):
			body.heldItem.reset_light_scale()
		_level.set_checkpoint(body.global_position)
