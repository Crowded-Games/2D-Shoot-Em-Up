extends CharacterBody2D

@export var speed = 100.0
@export var health: int = 1
# assigned on ready, this stops a flood of errors.
@export var player_name = "Character"
var player

func _ready():
	if get_parent().get_node_or_null(player_name) != null:
		player = get_parent().get_node(player_name)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# These 3 little lines of code handle movement! Don't ask me why velocity has to be set this way.
	if player != null:
		self.look_at(player.get("position"))
		self.velocity = Vector2(0, 0)
		self.position.x = move_toward(self.position.x, player.get("position").x, speed * delta)
		self.position.y = move_toward(self.position.y, player.get("position").y, speed * delta)
	
	move_and_slide()

# Destroy the player
func _on_area_detector_body_entered(body):
	if body.name == player_name && body.get("die") != true:
		body.Die()

# Get hit, or die.
func hit():
	health -= 1
	if health == 0:
		get_node("Kill").set_emitting(true)
		get_node("Kill/Sound").play()
		get_node("Kill").reparent(get_parent().get_parent())
		self.queue_free()
