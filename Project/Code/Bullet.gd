extends Area2D

const SPEED = 800.0
var area_direction = Vector2(0, 0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.translate(area_direction * SPEED * delta)

func _on_body_entered(body):
	# make sure walls aren't destroyed!
	if body.is_in_group("Enemy"):
		body.queue_free()
		get_node("Kill").set_emitting(true)
		get_node("Kill/Sound").play()
		get_node("Kill").reparent(get_parent().get_parent())
		self.queue_free()
	else:
		get_node("Poof").set_emitting(true)
		get_node("Poof/Sound").play()
		get_node("Poof").reparent(get_parent().get_parent())
		self.queue_free()
		
