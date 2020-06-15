extends Node2D

# var is how you declar variables (var x = 0).
# export means the var can be changed in the editor (export var x = 0).
# NAME: TYPE means the var can only be that type. Without it in can be any thing
# var x = 0
# x = "hello world"
# x = false
# That would be ok but if it was (var x: int = 0) it would cause an error
 
export var size: float = 1.0


# Called when the node enters the scene tree for the first time.
func _ready():
	create_builnding()

func create_builnding():
	var shape: Polygon2D = Polygon2D.new() # This make a new Polygon2D class you can modfie it but its not in the game yet.
	
	var points = [Vector2(200, 200), Vector2(400, 200), Vector2(400, 400), Vector2(200, 400)]
	
	shape.polygon = points
	
	self.add_child(shape) # This is what adds the shape into the game world.
	
	shape.color = Color(.5, 0, 0) # You can still modfie it after its added to the game world
