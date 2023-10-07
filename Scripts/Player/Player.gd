extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = 200

func _input(event):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("A"):
		$AnimationPlayer.play("RunL")
		velocity.x = -1
	elif Input.is_action_pressed("D"):
		$AnimationPlayer.play("RunR")
		velocity.x = 1
	if Input.is_action_pressed("W"):
		$AnimationPlayer.play("RunL")
		velocity.y = -1
	elif Input.is_action_pressed("S"):
		$AnimationPlayer.play("RunR")
		velocity.y = 1
		
	if velocity == Vector2.ZERO:
		$AnimationPlayer.play("Idle")
	if Input.is_action_pressed("ui_select"):
		Attack()


func _process(delta):
	move_and_slide(velocity * speed)


func Attack():
	$AnimationPlayer.play("Attack")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Attack":
		$AnimationPlayer.play("Idle")
