extends Actor

export var startup_speed = 350
export var accel = 50
export var jump_speed = 1050

func _physics_process(delta):
	var direction: = Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.get_action_strength("jump") and is_on_floor() else 1.0
	)

	print(direction)
	# acceleration + startup boost movement
	if(direction.x != 0 && velocity.x == 0 && abs(velocity.x + startup_speed*direction.x) <= max_speed.x):
		velocity.x += startup_speed * direction.x
	elif direction.x != 0 && abs(velocity.x + startup_speed*direction.x) <= max_speed.x:
		velocity.x += accel * direction.x

	# jump boost
	if(direction.y == -1.0):
		velocity.y -= velocity.y + jump_speed
		print("JUMP")


	velocity = move_and_slide(velocity, Vector2.UP)

	velocity = decel(velocity)
