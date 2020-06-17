extends Node2D

export var road_space: int = 800
export var vert_roads: int = 5
export var hroz_roads: int = 5

func _ready():
	var inter1 = load("res://Scenes/Road/Intersection.tscn").instance()
	var road = load("res://Scenes/Road/Road.tscn").instance()
	var inter2 = load("res://Scenes/Road/Intersection.tscn").instance()
	
	inter1.start_point = Vector2(0,0)
	inter1.dir = 3
	inter1.size = 200
	
	road.start_point = Vector2(0,0)
	road.dir = 1
	road.road_with = 100
	road.road_legth = 2000
	road.line_with = 5
	road.line_legth = 25
	
	inter2.start_point = Vector2(2000,0)
	inter2.dir = 1
	inter2.size = 200
	
	self.add_child(inter1)
	self.add_child(road)
	self.add_child(inter2)
	
	inter1.connect("make_road", self, "_on_make_road")
	inter2.connect("make_road", self, "_on_make_road")

func _on_make_road(start_point, dir):
	var road = load("res://Scenes/Road/Road.tscn").instance()
	var inter = load("res://Scenes/Road/Intersection.tscn").instance()
	
	road.start_point = start_point
	road.dir = dir
	road.road_with = 100
	road.road_legth = 2000
	road.line_with = 5
	road.line_legth = 25
	
	match dir:
		0:
			inter.start_point = start_point + Vector2(0,-2000)
		1:
			inter.start_point = start_point + Vector2(2000,0)
		2:
			inter.start_point = start_point + Vector2(0,2000)
		3:
			inter.start_point = start_point + Vector2(-2000,0)
	inter.dir = dir
	inter.size = 200
	
	self.add_child(road)
	self.add_child(inter)
	
	inter.connect("make_road", self, "_on_make_road")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	print("test")
