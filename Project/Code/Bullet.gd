extends Area2D

const SPEED = 800.0
var area_direction = Vector2(0, 0)
var debounce = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.translate(area_direction * SPEED * delta)

func _on_body_entered(body):
	# Stops an error that crashes the game.
	if debounce == true:
		return
	debounce = true
	# make sure walls aren't destroyed!
	if body.is_in_group("Enemy"):
		body.hit()
		self.hit()
	else:
		poof()

# make the bullet disappear with a poof :D
func poof():
	get_node("Poof").set_emitting(true)
	get_node("Poof/Sound").play()
	get_node("Poof").reparent(get_parent().get_parent())
	self.queue_free()

func hit():
	get_node("Hit").set_emitting(true)
	get_node("Hit/Sound").play()
	get_node("Hit").reparent(get_parent().get_parent())
	self.queue_free()
