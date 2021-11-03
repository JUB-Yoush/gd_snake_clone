extends Area2D
#randomly set location
#if the node is colliding with a body in it's location, set a new location
#(check if the apple's location will be the heads location manually)

var tile_size = 32
func _ready() -> void:
	randomize()
	find_location()

func find_location():
	var positionx = randi() % 19
	var positiony = randi() % 14
	print(positionx, " ", positiony)
	position.x = (positionx * tile_size) + tile_size/2
	position.y = (positiony * tile_size) + tile_size/2
	print(position.x, " ", position.y)

