extends Node
class_name MovementComponent

@export var body: CharacterBody2D

func apply_movement(move_dir: Vector2, speed: float):
	#body.velocity.x = move_dir.x * speed
	#body.velocity.y = move_dir.y * speed
	body.velocity = move_dir * speed
	body.move_and_slide()
	
