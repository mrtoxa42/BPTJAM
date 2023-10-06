extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = 200

func _input(event):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("A"):
		velocity.x = -1
	elif Input.is_action_pressed("D"):
		velocity.x = 1
	if Input.is_action_pressed("W"):
		velocity.y = -1
	elif Input.is_action_pressed("S"):
		velocity.y = 1


func _process(delta):
	move_and_slide(velocity * speed)
