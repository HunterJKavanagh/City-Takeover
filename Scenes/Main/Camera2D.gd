extends Camera2D


export (int) var speed = 20

func _input(event):
	if event.is_action_pressed('zoom_in'):
		self.zoom -= Vector2(.1,.1)
	if event.is_action_pressed('zoom_out'):
		self.zoom +=Vector2(.1,.1)
func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed('right'):
		velocity.x += 1
	if Input.is_action_pressed('left'):
		velocity.x -= 1
	if Input.is_action_pressed('down'):
		velocity.y += 1
	if Input.is_action_pressed('up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed
	self.position += velocity
