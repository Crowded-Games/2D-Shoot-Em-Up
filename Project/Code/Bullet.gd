extends Area2D

const SPEED = 800.0
var area_direction = Vector2(0, 0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.translate(area_direction * SPEED * delta)

func _on_body_entered(body):
	body.queue_free()
	self.queue_free()
