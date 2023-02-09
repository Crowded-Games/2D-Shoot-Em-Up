extends Area2D

const SPEED = 500.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.translate(Vector2(SPEED * delta, 0))
