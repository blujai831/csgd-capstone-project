class_name Level
extends Node2D

var _checkpoint := Vector2(NAN, NAN)

func _unhandled_input(event: InputEvent):
	if event.is_action_released(&'restart_level'):
		var checkpoint := _checkpoint # preserve thru self-destruct
		var any_checkpoint := any_checkpoint_set()
		var tree := get_tree()
		tree.change_scene_to_file(scene_file_path)
		if any_checkpoint:
			var defer := func ():
				var player_character: PlayerCharacter = null
				while player_character == null:
					await tree.node_added
					player_character = (
						tree.current_scene.get_node_or_null(^'PlayerCharacter')
					) as PlayerCharacter
				player_character.global_position = checkpoint
			defer.call_deferred()

func set_checkpoint(checkpoint: Vector2):
	_checkpoint = checkpoint

func any_checkpoint_set() -> bool:
	return not (is_nan(_checkpoint.x) or is_nan(_checkpoint.y))
