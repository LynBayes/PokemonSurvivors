extends CharacterBody2D
class_name Player


enum State{
	IDLE,
	RUN
}

enum Direction{
	UP,
	LEFT,
	DOWN,
	RIGHT
}


@export var input_component: InputComponent
@export var movement_component: MovementComponent

@export var animation_tree: AnimationTree
@onready var animation_playback: AnimationNodeStateMachinePlayback = animation_tree["parameters/playback"]
@export var speed: float = 100.0
var state: State
var direction: Direction


func _ready() -> void:
	animation_tree.set_active(true)
	state = State.IDLE
	direction = Direction.DOWN
	update_animation()


func _unhandled_input(_event: InputEvent) -> void:
	input_component.update()
	
	if input_component.move_direction != Vector2.ZERO:
		update_direction()
		
		animation_tree.set("parameters/run/BlendSpace2D/blend_position", input_component.move_direction)
		if state != State.RUN:
			state = State.RUN
			update_animation()
		#movement_component.apply_movement(input_component.move_direction, speed)
	elif state != State.IDLE:
		state = State.IDLE
		update_animation()
	
	


func _physics_process(delta: float) -> void:
	if state == State.RUN:
		movement_component.apply_movement(input_component.move_direction, speed)


func update_animation() -> void:
	match state:
		State.IDLE:
			var move_dir: Vector2
			match direction:
				Direction.UP:
					move_dir = Vector2(0.0, -1.0)
				Direction.LEFT:
					move_dir = Vector2(-1.0, 0.0)
				Direction.DOWN:
					move_dir = Vector2(0.0, 1.0)
				Direction.RIGHT:
					move_dir = Vector2(1.0, 0.0)
			animation_tree.set("parameters/idle/BlendSpace2D/blend_position", move_dir)
			animation_playback.travel("idle")
		State.RUN:
			animation_playback.travel("run")


func update_direction() -> void:
	var move_dir = input_component.move_direction
	
	print(move_dir)
	
	if move_dir.y > 0.0:
		direction = Direction.DOWN
	elif move_dir.y < 0.0:
		direction = Direction.UP
	
	if move_dir.x > 0.0:
		direction = Direction.RIGHT
	elif move_dir.x < 0.0:
		direction = Direction.LEFT
