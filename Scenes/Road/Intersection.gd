extends Node2D

export var start_point: Vector2 = Vector2( 512, 300)
export var dir: int = 0
export var size: int = 100

var point_f: Vector2
var point_r: Vector2
var point_b: Vector2
var point_l: Vector2

var button_f: Button
var button_r: Button
var button_b: Button
var button_l: Button

signal make_road(start_point, dir)

func _on_button_f_pressed():
	print("f")
	emit_signal("make_road", point_f, _new_road_dir(dir, 0))
func _on_button_r_pressed():
	print("r")
	emit_signal("make_road", point_r, _new_road_dir(dir, 1))
func _on_button_b_pressed():
	print("b")
	emit_signal("make_road", point_b, _new_road_dir(dir, 2))
func _on_button_l_pressed():
	print("l")
	emit_signal("make_road", point_l, _new_road_dir(dir, 3))
	
func _new_road_dir(iter_dir, side_dir):
	var sum = iter_dir + side_dir
	return sum if sum <= 3 else (sum - 4)

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
	
	line.default_color = Color(0.9,0.9,0.9)
	self.add_child(line)
	
	
	var line_f = Line2D.new()
	line_f.add_point(point_f + Vector2(0, 10))
	line_f.add_point(point_f + Vector2(0, -10))
	line_f.default_color = Color(0,1,0)
	line_f.width = 20
	button_f = Button.new()
	button_f.rect_size = Vector2(20,20)
	button_f.rect_position = point_f - (button_f.rect_size/2)
	
	var line_r = Line2D.new()
	line_r.add_point(point_r + Vector2(10, 0))
	line_r.add_point(point_r + Vector2(-10, 0))
	line_r.default_color = Color(1,0,0)
	line_r.width = 20
	button_r = Button.new()
	button_r.rect_size = Vector2(20,20)
	button_r.rect_position = point_r - (button_r.rect_size/2)
	
	var line_b = Line2D.new()
	line_b.add_point(point_b + Vector2(0, 10))
	line_b.add_point(point_b + Vector2(0, -10))
	line_b.default_color = Color(0,0,0)
	line_b.width = 20
	button_b = Button.new()
	button_b.rect_size = Vector2(20,20)
	button_b.rect_position = point_b - (button_b.rect_size/2)
	
	var line_l = Line2D.new()
	line_l.add_point(point_l + Vector2(10, 0))
	line_l.add_point(point_l + Vector2(-10, 0))
	line_l.default_color = Color(0,0,1)
	line_l.width = 20
	button_l = Button.new()
	button_l.rect_size = Vector2(20,20)
	button_l.rect_position = point_l - (button_l.rect_size/2)
	
	button_f.connect("pressed", self, "_on_button_f_pressed")
	button_r.connect("pressed", self, "_on_button_r_pressed")
	button_b.connect("pressed", self, "_on_button_b_pressed")
	button_l.connect("pressed", self, "_on_button_l_pressed")
	
	self.add_child(line_f)
	self.add_child(button_f)
	
	self.add_child(line_r)
	self.add_child(button_r)
	
	self.add_child(line_b)
	self.add_child(button_b)
	
	self.add_child(line_l)
	self.add_child(button_l)
	
	
