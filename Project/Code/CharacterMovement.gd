extends CharacterBody2D

const SPEED = 300.0
@export var Bullet: PackedScene

func _physics_process(_delta):

	# Get the input direction and handle the movement/deceleration.
	var direction_x = Input.get_axis("Left", "Right")
	var direction_y = Input.get_axis("Up", "Down")
	velocity.x = 0
	velocity.y = 0
	
	if Input.get_action_raw_strength("Shoot"):
		var temp = Bullet.instantiate()
		add_child(temp)
		temp.global_position = self.global_position
		# this sets the rotation as to where it will fire
	
	if direction_x:
		velocity.x = direction_x * SPEED
	if direction_y:
		velocity.y = direction_y * SPEED
		
	self.look_at(get_global_mouse_position())
	
	move_and_slide()
