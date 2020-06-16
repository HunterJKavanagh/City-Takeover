extends Node2D

export var start_point: Vector2 = Vector2( 512, 300)
export var dir: int = 0
export var size: int = 100

var point_f: Vector2
var point_r: Vector2
var point_b: Vector2
var point_l: Vector2

func _ready():
	var point0: Vector2
	var point1: Vector2
	var point2: Vector2
	var point3: Vector2
	
	match dir:
		0:
			point_f = start_point + Vector2(0, -size)
			point_r = start_point + Vector2(size/2, -size/2)
			point_b = start_point
			point_l = start_point + Vector2(-size/2, -size/2)
			
			point0 = start_point + Vector2(size/2,0) 
			point1 = start_point + Vector2(size/2,-size)
			point2 = start_point + Vector2(-size/2,-size)
			point3 = start_point + Vector2(-size/2,0)
		1:
			point_f = start_point + Vector2(size, 0)
			point_r = start_point + Vector2(size/2, size/2)
			point_b = start_point
			point_l = start_point + Vector2(size/2, -size/2)
			
			point0 = start_point + Vector2(0,size/2) 
			point1 = start_point + Vector2(size,size/2)
			point2 = start_point + Vector2(size,-size/2)
			point3 = start_point + Vector2(0,-size/2)
		2:
			point_f = start_point + Vector2(0, size)
			point_r = start_point + Vector2(-size/2, size/2)
			point_b = start_point
			point_l = start_point + Vector2(size/2, size/2)
			
			point0 = start_point + Vector2(-size/2,0) 
			point1 = start_point + Vector2(-size/2,size)
			point2 = start_point + Vector2(size/2,size)
			point3 = start_point + Vector2(size/2,0)
		3:
			point_f = start_point + Vector2(-size, 0)
			point_r = start_point + Vector2(-size/2, -size/2)
			point_b = start_point
			point_l = start_point + Vector2(-size/2, size/2)
			
			point0 = start_point + Vector2(0,-size/2) 
			point1 = start_point + Vector2(-size,-size/2)
			point2 = start_point + Vector2(-size,size/2)
			point3 = start_point + Vector2(0,size/2) 
	
	var line: Line2D = Line2D.new()
	
	line.add_point(start_point)
	line.add_point(point0)
	line.add_point(point1)
	line.add_point(point2)
	line.add_point(point3)
	line.add_point(start_point)
	
	self.add_child(line)
	
	
	var line_f = Line2D.new()
	line_f.add_point(point_f + Vector2(0, 10))
	line_f.add_point(point_f + Vector2(0, -10))
	line_f.default_color = Color(1,1,1)
	line_f.width = 20
	var line_r = Line2D.new()
	line_r.add_point(point_r + Vector2(10, 0))
	line_r.add_point(point_r + Vector2(-10, 0))
	line_r.default_color = Color(1,0,0)
	line_r.width = 20
	var line_b = Line2D.new()
	line_b.add_point(point_b + Vector2(0, 10))
	line_b.add_point(point_b + Vector2(0, -10))
	line_b.default_color = Color(0,0,0)
	line_b.width = 20
	var line_l = Line2D.new()
	line_l.add_point(point_l + Vector2(10, 0))
	line_l.add_point(point_l + Vector2(-10, 0))
	line_l.default_color = Color(0,0,1)
	line_l.width = 20
	
	self.add_child(line_f)
	self.add_child(line_r)
	self.add_child(line_b)
	self.add_child(line_l)
