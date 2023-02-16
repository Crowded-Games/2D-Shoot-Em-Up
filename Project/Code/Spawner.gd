extends Marker2D

@export var Enemy: PackedScene
@export var small_timer_randomization: bool = false

@export var spawn_interval = 2.5
var actual_spawn_interval = spawn_interval
var timer = 0

func _ready():
	if small_timer_randomization == true:
		actual_spawn_interval = spawn_interval + randf_range(-0.75, 0.75)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta
	# Handle spawning
	if timer >= actual_spawn_interval - 1 && !get_node("AnimationPlayer").is_playing():
		get_node("AnimationPlayer").play("spawn")

func spawn():
	timer = 0
	var temp = Enemy.instantiate()
	# The randomization at the end is so that way the collisions don't go fucky wucky
	temp.global_position = self.global_position + Vector2(randf_range(-2, 2), randf_range(-2, 2))
	add_sibling(temp)
	if small_timer_randomization == true:
		actual_spawn_interval = spawn_interval + randf_range(-0.75, 0.75)
