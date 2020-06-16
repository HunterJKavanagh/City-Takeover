extends Node2D

export var road_space: int = 800
export var vert_roads: int = 5
export var hroz_roads: int = 5

func _ready():
	for v in vert_roads:
		var road = load("res://Scenes/Road/Road.tscn").instance()
		road.dir = 2
		road.road_with = 100
		road.road_legth = 2000
		road.line_with = 5
		road.line_legth = 25
		road.start_point = Vector2(road_space * v, 0)
		
		self.add_child(road)
	for h in hroz_roads:
		var road = load("res://Scenes/Road/Road.tscn").instance()
		road.dir = 1
		road.road_with = 100
		road.road_legth = 2000
		road.line_with = 5
		road.line_legth = 25
		road.start_point = Vector2(0, h * road_space)
		
		self.add_child(road)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
