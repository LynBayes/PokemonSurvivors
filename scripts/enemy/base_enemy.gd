extends CharacterBody2D
class_name BaseEnemy


enum State {
	IDLE,
	WANDER,
	CHASE,
	STUN
}

@export var movement_component: MovementComponent

@export var speed: float = 120.0
var state: State = State.IDLE

var move_direction = Vector2.ZERO


func _physics_process(_delta: float) -> void:
	if state == State.STUN or state == State.IDLE:
		return
	
	# FIND PLAYER + DETERMINE DIRECTION
	
	movement_component.apply_movement(move_direction, speed)
