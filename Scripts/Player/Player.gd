extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = 200
var attack = false

func _input(event):
	velocity = Vector2.ZERO
	if attack == false:
		if Input.is_action_pressed("A"):
			velocity.x = -1
		elif Input.is_action_pressed("D"):
			velocity.x = 1
		if Input.is_action_pressed("W"):
			velocity.y = -1
		elif Input.is_action_pressed("S"):
			velocity.y = 1
		if Input.is_action_pressed("ui_select"):
			Attack()



func _process(delta):
	move_and_slide(velocity * speed)


func Attack():
	attack = true
	$AnimatedSprite.play("Attack")
	$AnimatedSprite.offset = Vector2(0,0)




func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "Attack":
		$AnimatedSprite.offset = Vector2(-0,0)
		$AnimatedSprite.play("Idle")
		attack = false
