extends CharacterBody2D

const SPEED = 300.0
@export var Bullet: PackedScene
@onready var Camera = get_node("Camera2D")
@export var fire_rate = 0.2
var timer = 0

func _ready():
	# I have no idea why this makes the camera do that thing, but this is cool!
	get_node("Camera2D").set("position", Vector2(100, 0))

func _physics_process(delta):
	timer += delta
	# Get the input direction and handle the movement/deceleration.
	var direction_x = Input.get_axis("Left", "Right")
	var direction_y = Input.get_axis("Up", "Down")
	
	if Input.get_action_raw_strength("Shoot") && timer >= fire_rate:
		var temp = Bullet.instantiate()
		add_sibling(temp)
		temp.global_position = get_node("BulletSpawn").get("global_position")
		# this sets the rotation as to where it will fire
		temp.set("area_direction", (get_global_mouse_position() - self.global_position).normalized())
		# These statements below handle camera shake
		get_node("Camera2D").set("offset", Vector2(randf_range(-4, 4), randf_range(-4, 4)))
		timer = 0
	else:
		get_node("Camera2D").set("offset", Vector2(0, 0))
	
	# movement is handled like this
	if direction_x:
		velocity.x = direction_x * SPEED
	else:
		velocity.x = 0
	if direction_y:
		velocity.y = direction_y * SPEED
	else:
		velocity.y = 0
		
	# look at mouse
	self.look_at(get_global_mouse_position())
	
	move_and_slide()
