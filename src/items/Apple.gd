extends Area2D
#randomly set location
#if the node is colliding with a body in it's location, set a new location
#(check if the apple's location will be the heads location manually)
var collectable = true
var found_empty_location = false
var tile_size = 32
signal eaten
func _ready() -> void:
	randomize()
	find_location()

func find_location():
	var positionx = randi() % 19
	var positiony = randi() % 14
	#print(positionx, " ", positiony)
	position.x = (positionx * tile_size) + tile_size/2
	position.y = (positiony * tile_size) + tile_size/2
	#print(position.x, " ", position.y)
	print(len(get_overlapping_areas()))
	if len(get_overlapping_areas()) > 2:
		find_location()
	else:
		print('collectable again')
		collectable = true
	



func _on_Apple_area_entered(area: Area2D) -> void:
	print('_on_Apple_area_entered')
	if collectable == true:
		collectable = false
		print('emit_signal(eaten)')
		emit_signal('eaten')
		find_location()
		
