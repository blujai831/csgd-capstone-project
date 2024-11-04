class_name HintEsc
extends Hint

@onready var _player_character := $'../../PlayerCharacter' as PlayerCharacter

func _should_open():
	var rect = get_viewport_rect()*_player_character.get_canvas_transform()
	return (
		_player_character.global_position.y >=
		rect.position.y + rect.size.y + 200
	)

func _should_close():
	return Input.is_action_pressed(&'restart_level')
