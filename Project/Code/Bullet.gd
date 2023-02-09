extends Area2D

const SPEED = 800.0
var area_direction = Vector2(0, 0)

var alive_timer = 5.0
var timer = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta
	self.translate(area_direction * SPEED * delta)
	# kill itself in case something happens so there is no useless processing of something that isn't there
	if timer >= alive_timer:
		self.queue_free()

func _on_body_entered(body):
	# make sure walls aren't destroyed!
	if body.is_in_group("Enemy"):
		body.queue_free()
		self.queue_free()
	else:
		self.queue_free()
