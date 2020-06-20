extends Node2D
 
export var size: float = 1.0
export var start_point: Vector2
export var dir: int
export var side: int
export var color: Color = Color(0.4,0.4,.4)

export var size_h: float
export var size_w: float

func _ready():
	create_builnding()

func create_builnding():
	var poly: Polygon2D = Polygon2D.new()
	var line: Line2D = Line2D.new()
	
	var point0: Vector2
	var point1: Vector2
	var point2: Vector2
	var point3: Vector2
	
	if side == Lib.Side.RIGHT:
		match dir:
			Lib.Dir.UP:
				point0 = start_point + Vector2(0,size_w/2)
				point1 = start_point + Vector2(-size_h,size_w/2)
				point2 = start_point + Vector2(-size_h,-size_w/2)
				point3 = start_point + Vector2(0,-size_w/2)
			Lib.Dir.RIGHT:
				point0 = start_point + Vector2(-size_w/2,0)
				point1 = start_point + Vector2(-size_w/2,-size_h)
				point2 = start_point + Vector2(size_w/2,-size_h)
				point3 = start_point + Vector2(size_w/2,0)
			Lib.Dir.DOWN:
				point0 = start_point + Vector2(0,-size_w/2)
				point1 = start_point + Vector2(-size_h,-size_w/2)
				point2 = start_point + Vector2(-size_h,size_w/2)
				point3 = start_point + Vector2(0,size_w/2)
			Lib.Dir.LEFT:
				point0 = start_point + Vector2(size_w/2,0)
				point1 = start_point + Vector2(size_w/2,-size_h)
				point2 = start_point + Vector2(-size_w/2,-size_h)
				point3 = start_point + Vector2(-size_w/2,0)
	elif side == Lib.Side.LEFT:
		match dir:
			Lib.Dir.UP:
				point0 = start_point + Vector2(0,size_w/2)
				point1 = start_point + Vector2(size_h,size_w/2)
				point2 = start_point + Vector2(size_h,-size_w/2)
				point3 = start_point + Vector2(0,-size_w/2)
			Lib.Dir.RIGHT:
				point0 = start_point + Vector2(size_w/2,0)
				point1 = start_point + Vector2(size_w/2, size_h)
				point2 = start_point + Vector2(-size_w/2, size_h)
				point3 = start_point + Vector2(-size_w/2,0)
			Lib.Dir.DOWN:
				point0 = start_point + Vector2(0,size_w/2)
				point1 = start_point + Vector2(size_h,size_w/2)
				point2 = start_point + Vector2(size_h,-size_w/2)
				point3 = start_point + Vector2(0,-size_w/2)
			Lib.Dir.LEFT:
				point0 = start_point + Vector2(-size_w/2,0)
				point1 = start_point + Vector2(-size_w/2,size_h)
				point2 = start_point + Vector2(size_w/2,size_h)
				point3 = start_point + Vector2(size_w/2,0)
	
	line.add_point(start_point)
	line.add_point(point0)
	line.add_point(point1)
	line.add_point(point2)
	line.add_point(point3)
	line.add_point(start_point)
	
	line.default_color = Color(color.r, color.g, color.b, 0.8)
	
	poly.polygon = [point0, point1, point2, point3]
	
	poly.color = Color(color.r, color.g, color.b, 0.2)
	
	self.add_child(line)
	self.add_child(poly)
