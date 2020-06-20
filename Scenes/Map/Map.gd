extends Node2D

export var road_width = 100
export var road_length = 2000
export var road_line_width = 5
export var road_line_length = 25
export var road_color = Color(0.9,0.9,0.9)

export var building_min_spacing = 20
export var building_min_width = 2000 / 9
export var building_max_width = 2000 / 3  - 20
export var building_min_length = 2000 / 4
export var building_max_length = 2000 / 2  - 20

func _ready():
	create_intersection(Vector2(0,0), Lib.Dir.LEFT)
	create_road(Vector2(0,0), Lib.Dir.RIGHT)
	create_intersection(Vector2(road_length,0), Lib.Dir.RIGHT)

func _on_build_road(start_point, dir):
	var inter_start_point
	match dir:
		Lib.Dir.UP:
			inter_start_point = start_point + Vector2(0,-road_length)
		Lib.Dir.RIGHT:
			inter_start_point = start_point + Vector2(road_length,0)
		Lib.Dir.DOWN:
			inter_start_point = start_point + Vector2(0,road_length)
		Lib.Dir.LEFT:
			inter_start_point = start_point + Vector2(-road_length,0)
	
	
	create_road(start_point, dir)
	create_intersection(inter_start_point, dir)

func create_road(start_point: Vector2, dir: int, r_w = road_width, r_l = road_length, r_l_w = road_line_width, r_l_l = road_line_length, r_c = road_color):
	var road = load("res://Scenes/Road/Road.tscn").instance()
	road.start_point = start_point
	road.dir = dir
	road.road_width = r_w
	road.road_length = r_l
	road.line_width = r_l_w
	road.line_length = r_l_l
	self.add_child(road)
	
	gen_buildings(start_point, dir)
	
	return road

func gen_buildings(start_point: Vector2, dir: int):
	var b_p_r: Vector2
	var b_p_l: Vector2
	var dir_mod: Vector2
	var b_space: float
	
	match dir:
		Lib.Dir.UP:
			b_p_r = start_point + Vector2(-road_width - building_min_spacing,0)
			b_p_l = start_point + Vector2(road_width + building_min_spacing,0)
			dir_mod = Vector2(0,-1)
		Lib.Dir.RIGHT:
			b_p_r = start_point + Vector2(0,-road_width - building_min_spacing)
			b_p_l = start_point + Vector2(0,road_width + building_min_spacing)
			dir_mod = Vector2(1,0)
		Lib.Dir.DOWN:
			b_p_r = start_point + Vector2(-road_width - building_min_spacing,0)
			b_p_l = start_point + Vector2(road_width + building_min_spacing,0)
			dir_mod = Vector2(0,1)
		Lib.Dir.LEFT:
			b_p_r = start_point + Vector2(0,-road_width - building_min_spacing)
			b_p_l = start_point + Vector2(0,road_width + building_min_spacing)
			dir_mod = Vector2(-1,0)
	
	var total_width: float
	var buildings_widths: Array
	
	# right side
	total_width = 0
	buildings_widths = []
	
	while total_width <= road_length:
		var width = rand_range(building_min_width, building_max_width)
		
		if total_width + width + building_min_spacing  > road_length:
			if width + (road_width - (total_width + width + building_min_spacing)) >= building_min_width:
				width = width + (road_width - (total_width + width + building_min_spacing))
			else:
				break
		
		buildings_widths.push_back(width)
		
		total_width += width + building_min_spacing
	
	b_space = (road_length - total_width) / buildings_widths.size()
	
	for w in buildings_widths:
		var temp_b_p = b_p_r + (Vector2(w/2,w/2) * dir_mod) + (Vector2(b_space,b_space) * dir_mod)
		
		var building = load("res://Scenes/Building/Building.tscn").instance()
		building.dir = dir
		building.side = Lib.Side.RIGHT
		building.start_point = temp_b_p
		building.size_w = w
		building.size_h = rand_range(building_min_length, building_max_length)
		
		self.add_child(building)
		
		b_p_r = b_p_r + (Vector2(w,w) * dir_mod) + (Vector2(b_space,b_space) * dir_mod)
	
	# left side
	total_width = 0
	buildings_widths = []
	
	while total_width <= road_length:
		var width = rand_range(building_min_width, building_max_width)
		
		if total_width + width + building_min_spacing  > road_length:
			if width + (road_width - (total_width + width + building_min_spacing)) >= building_min_width:
				width = width + (road_width - (total_width + width + building_min_spacing))
			else:
				break
		
		buildings_widths.push_back(width)
		
		total_width += width + building_min_spacing
	
	b_space = (road_length - total_width) / buildings_widths.size()
	
	for w in buildings_widths:
		var temp_b_p = b_p_l + (Vector2(w/2,w/2) * dir_mod) + (Vector2(b_space,b_space) * dir_mod)
		
		var building = load("res://Scenes/Building/Building.tscn").instance()
		building.dir = dir
		building.side = Lib.Side.LEFT
		building.start_point = temp_b_p
		building.size_w = w
		building.size_h = rand_range(building_min_length, building_max_length)
		
		self.add_child(building)
		
		b_p_l = b_p_l + (Vector2(w,w) * dir_mod) + (Vector2(b_space,b_space) * dir_mod) 

func create_intersection(start_point: Vector2, dir: int, size = road_width * 2):
	var inter = load("res://Scenes/Road/Intersection.tscn").instance()
	inter.start_point = start_point
	inter.dir = dir
	inter.size = size
	self.add_child(inter)
	inter.connect("build_road", self, "_on_build_road")
	
	return inter
