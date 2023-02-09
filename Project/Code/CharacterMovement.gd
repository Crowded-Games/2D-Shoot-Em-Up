extends CharacterBody2D

const SPEED = 300.0
@export var Bullet: PackedScene
@onready var Camera = get_node("Camera2D")

func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	var direction_x = Input.get_axis("Left", "Right")
	var direction_y = Input.get_axis("Up", "Down")
	
	if Input.get_action_raw_strength("Shoot"):
		var temp = Bullet.instantiate()
		add_sibling(temp)
		temp.global_position = get_node("BulletSpawn").get("global_position")
		# this sets the rotation as to where it will fire
		temp.set("area_direction", (get_global_mouse_position() - self.global_position).normalized())
	
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
