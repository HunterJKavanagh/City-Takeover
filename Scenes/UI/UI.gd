extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
var time = 0

func _process(delta):
	time += delta
	$Label.text = time as String

func _ready():
	pass
