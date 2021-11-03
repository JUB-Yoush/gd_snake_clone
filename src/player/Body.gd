extends Area2D



var tile_size = 32
var snake_len = 0

func _ready() -> void:
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2


func delete():
	queue_free()
