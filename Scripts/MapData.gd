class_name MapData

enum Data {IS_BUILDING, BUILDING_NUM}

var sub_div = 8

var graph: Graph = Graph.new()

func _init():
	for x in sub_div:
		for y in sub_div:
			graph.add_vertex(Vector2(x,y), {Data.IS_BUILDING: false, Data.BUILDING_NUM: null})
	
	var side = Lib.Dir.UP
	var is_built
	
	while !is_built:
		var v1: Vector2
		var v2: Vector2
		var rand_n: int = (randi() % sub_div - 2) + 1
		
		match side:
			Lib.Dir.UP:
				v1 = Vector2(rand_n, 0)
				v2 = Vector2(rand_n, 1)
			Lib.Dir.RIGHT:
				v1 = Vector2(sub_div, rand_n)
				v2 = Vector2(sub_div - 1, rand_n)
			Lib.Dir.DOWN:
				v1 = Vector2(rand_n, sub_div)
				v2 = Vector2(rand_n, sub_div - 1)
			Lib.Dir.LEFT:
				v1 = Vector2(0, rand_n)
				v2 = Vector2(1, rand_n)
		
		if graph.vertices[v1].data[Data.IS_BUILDING]:
			continue
		
		var by_building: bool = false
		
		match side:
			Lib.Dir.UP:
				if graph.vertices[Vector2(v1.x - 1, v1.y)].data[Data.IS_BUILDING]:
					by_building = true
				if graph.vertices[Vector2(v1.x + 1, v1.y)].data[Data.IS_BUILDING]:
					by_building = true
			Lib.Dir.RIGHT:
				if graph.vertices[Vector2(v1.x, v1.y - 1)].data[Data.IS_BUILDING]:
					by_building = true
				if graph.vertices[Vector2(v1.x, v1.y + 1)].data[Data.IS_BUILDING]:
					by_building = true
			Lib.Dir.DOWN:
				if graph.vertices[Vector2(v1.x, v1.y - 1)].data[Data.IS_BUILDING]:
					by_building = true
				if graph.vertices[Vector2(v1.x, v1.y + 1)].data[Data.IS_BUILDING]:
					by_building = true
			Lib.Dir.LEFT:
				if graph.vertices[Vector2(v1.x - 1, v1.y)].data[Data.IS_BUILDING]:
					by_building = true
				if graph.vertices[Vector2(v1.x + 1, v1.y)].data[Data.IS_BUILDING]:
					by_building = true
		
		if by_building:
			continue
		
		graph.vertices[v1].data[Data.IS_BUILDING] = true
		graph.vertices[v2].data[Data.IS_BUILDING] = true
		graph.add_edge(v1, v2)

func is_side(id: Vector2):
	if id.x == 0 or id.x == sub_div or id.y == 0 or id.y == sub_div:
		return true
	else:
		return false
