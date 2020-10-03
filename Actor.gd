extends KinematicBody2D
class_name Actor

export var max_speed: = Vector2(3000,3000)

export var gravity = 3000
var velocity: = Vector2.ZERO
export var decel = Vector2(0.90,1.0)

func decel(vel):
	vel *= decel

	if(-50<= vel.x and vel.x <= 50):
		vel.x = 0
	return vel


func _physics_process(delta):

	if velocity.y + gravity * delta <= max_speed.y:
		velocity.y += gravity * delta

	
