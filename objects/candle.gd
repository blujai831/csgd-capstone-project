class_name Candle
extends CarriableItem

const DEFAULT_LIGHT_SCALE = Vector2.ONE

@onready var _collision_light = $CollisionEnablingLight
@onready var _sprite = $AnimatedSprite2D

var _hide_timer: float = -1.0
var _initial_light_scale = DEFAULT_LIGHT_SCALE

func _ready():
	super()
	_initial_light_scale = _collision_light.scale

# Initialize the candle with specific properties
func initialize(scale_factor: float) -> void:
	if _collision_light:
		_collision_light.scale *= scale_factor

func get_light_scale() -> Vector2:
	return _collision_light.scale

func set_light_scale(_new_scale: Vector2):
	if _collision_light:
		_collision_light.scale = _new_scale

func reset_light_scale():
	set_light_scale(_initial_light_scale)

func hide_for_break_animation(duration: float):
	_hide_timer = duration
	_sprite.visible = false

func _process(delta: float):
	if _hide_timer > 0:
		_hide_timer -= delta
	if _hide_timer <= 0: # Intentionally if, not elif
		_sprite.visible = true
