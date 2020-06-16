extends Node2D

export var start_point: Vector2 = Vector2(512, 0)
var end_point: Vector2
export var dir: int
export var road_with: int = 100
export var road_legth: int = 500
export var line_with: int = 5
export var line_legth: int = 25
var mid_line_dir: Vector2
var outer_line_dir: Vector2

func _ready():
	match dir:
		0: 
			end_point = start_point - Vector2(0, road_legth)
			mid_line_dir = Vector2(0, -line_legth)
			outer_line_dir = Vector2(road_with, 0)
		1:
			end_point = start_point + Vector2(road_legth, 0)
			mid_line_dir = Vector2(line_legth, 0)
			outer_line_dir = Vector2(0, road_with)
		2:
			end_point = start_point + Vector2(0, road_legth)
			mid_line_dir = Vector2(0, line_legth)
			outer_line_dir = Vector2(road_with, 0)
		3:
			end_point = start_point - Vector2(road_legth, 0)
			mid_line_dir = Vector2(-line_legth, 0)
			outer_line_dir = Vector2(0, road_with)
	
	
	var left_line: Line2D = Line2D.new()
	var right_line: Line2D = Line2D.new()
	
	left_line.add_point(start_point + outer_line_dir)
	left_line.add_point(end_point + outer_line_dir)
	left_line.default_color = Color(.9,.9,.9)
	
	right_line.add_point(start_point - outer_line_dir)
	right_line.add_point(end_point - outer_line_dir)
	right_line.default_color = Color(.9,.9,.9)
	
	self.add_child(left_line)
	self.add_child(right_line)
	
	
	var distance = distance(start_point, end_point)
	
	var number_of_lines = distance / (2 * line_legth)
	
	var last_point: Vector2 = Vector2(0,0) 
	
	for x in range((number_of_lines + 1) as int):
		var line: Line2D = Line2D.new()
		
		print(x)
		
		if x == 0:
			line.add_point(start_point)
			
			line.add_point(start_point + mid_line_dir)
			
			last_point = start_point + mid_line_dir
		else: 
			line.add_point(last_point + mid_line_dir)
			
			line.add_point(last_point + mid_line_dir * 2)
			
			last_point = last_point + mid_line_dir * 2
		
		line.default_color = Color(.9,.9,.9)
		self.add_child(line)


func distance(point_1: Vector2, point_2: Vector2):
	return sqrt( pow(point_1.y - point_2.y , 2) + pow( point_1.x - point_2.x , 2) )

func slope(point_1: Vector2, point_2: Vector2):
	return (point_1.y - point_2.y) / (point_1.x - point_2.x)
	
func eline(x: float, point_1: Vector2, point_2: Vector2):
	return slope(point_1, point_2) * (x - point_1.x) + point_1.y
