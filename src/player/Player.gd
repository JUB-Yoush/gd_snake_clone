extends Area2D

var tile_size = 32
var directions: Dictionary = {
	'up': 0,
	'right': 90,
	'down': 180,
	'left':270
}
var forward_vector: Vector2
var inputs = {
	'up':Vector2.UP,
	'right':Vector2.RIGHT,
	'down':Vector2.DOWN,
	'left':Vector2.LEFT
}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed('up'):
		if rotation_degrees == 90 or rotation_degrees == 270:
			rotation_degrees = 0
		
	elif Input.is_action_just_pressed('right'):
		if rotation_degrees == 0 or rotation_degrees == 180:
			rotation_degrees = 90
		
	elif Input.is_action_just_pressed('down'):
		if rotation_degrees == 90 or rotation_degrees == 270:
			rotation_degrees = 180
	
	elif Input.is_action_just_pressed('left'):
		if rotation_degrees == 0 or rotation_degrees == 180:
			rotation_degrees = 270
		
func move():
	position += (Vector2.UP.rotated(deg2rad(rotation_degrees)) ) * tile_size

func _physics_process(delta: float) -> void:
	pass
		

func _on_MoveTimer_timeout() -> void:
	move()
