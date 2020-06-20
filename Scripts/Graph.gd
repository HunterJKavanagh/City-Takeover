class_name Graph

var vertices: Dictionary

func _init():
	pass

func add_vertex(id, data: Dictionary): 
	var new_vertex = Vertex.new(id, data)
	vertices[id] = new_vertex

func add_edge(from, to):
	vertices[from].add_connection(to)
	vertices[to].add_connection(from)

class Vertex:
	var data: Dictionary
	
	var id
	var connections = []
	
	func _init(id, data: Dictionary):
		self.id = id
		self.data = data

	func add_connection(id):
		connections.append(id)
