extends Area2D

var tile_size = 32
var size = 1
var is_head = true
var max_len = 3
onready var body_Scene = preload("res://src/player/Body.tscn")
onready var main = get_tree().get_root()
onready var bodiesNode = get_parent().get_node("BodyPieces")

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
	#print("x:",(position.x -16)," ","y:",(position.y -16))
	var body_piece = body_Scene.instance()
	body_piece.position.x = position.x - 32
	body_piece.position.y = position.y - 32
	
	var rot_vector = Vector2.UP.rotated(deg2rad(rotation_degrees))
	position.x += int((rot_vector.x) * tile_size)
	position.y += int((rot_vector.y) * tile_size)
	print("x:",(position.x -16)," ","y:",(position.y -16))
	var uncentered_tilex = (position.x - tile_size/2)  /tile_size
	var uncentered_tiley = (position.y - tile_size/2) /tile_size
	print("x Tile: ",(uncentered_tilex)," y Tile: " ,(uncentered_tiley))
	
	bodiesNode.add_child(body_piece)
	for i in bodiesNode.get_child_count():
		var current_child = bodiesNode.get_child(i)
		current_child.snake_len += 1
		if current_child.snake_len >= max_len:
			current_child.queue_free()
	

func _physics_process(delta: float) -> void:
	#var uncentered_tilex = (position.x - tile_size/2)  /tile_size
	#var uncentered_tiley = (position.y - tile_size/2) /tile_size
	pass

func _on_MoveTimer_timeout() -> void:
	move()
