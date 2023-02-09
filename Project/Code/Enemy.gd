extends CharacterBody2D

const SPEED = 100.0
@export var player_name = "Character"
# assigned on ready, this stops a flood of errors.
@onready var player = get_parent().get_node(player_name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# These 3 little lines of code handle movement! Don't ask me why velocity has to be set this way.
	if player != null:
		self.look_at(player.get("position"))
		self.velocity = Vector2(0, 0)
		self.position.x = move_toward(self.position.x, player.get("position").x, SPEED * delta)
		self.position.y = move_toward(self.position.y, player.get("position").y, SPEED * delta)
	
	move_and_slide()

func _on_area_detector_body_entered(body):
	if body.name == player_name:
		body.queue_free()
