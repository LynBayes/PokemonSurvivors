extends Node
class_name InputComponent

var debug_pressed: bool = false

var move_direction: Vector2 = Vector2.ZERO

var select_pressed: bool = false
var cancel_pressed: bool = false
var pause_pressed: bool = false

func update() -> void:
	
	move_direction = Input.get_vector("left", "right", "up", "down").normalized()
	
	debug_pressed = Input.is_action_just_pressed("debug")
	select_pressed = Input.is_action_just_pressed("select")
	cancel_pressed = Input.is_action_just_pressed("cancel")
	pause_pressed = Input.is_action_just_pressed("pause")
