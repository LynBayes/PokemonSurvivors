extends CharacterBody2D
class_name Player


@export var input_component: InputComponent
@export var movement_component: MovementComponent

@export var speed: float = 100.0

func _unhandled_input(event: InputEvent) -> void:
	input_component.update()
	
	if input_component.move_direction != Vector2.ZERO:
		movement_component.apply_movement(input_component.move_direction, speed)
		print(input_component.move_direction)
	


func _physics_process(delta: float) -> void:
	pass
