extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = 200
var attack = false

func _input(event):
	velocity = Vector2.ZERO
	if attack == false:
		if Input.is_action_pressed("A"):
			velocity.x = -1
			$AnimationPlayer.play("Run")
		elif Input.is_action_pressed("D"):
			$AnimationPlayer.play("Run")
			velocity.x = 1
		if Input.is_action_pressed("W"):
			$AnimationPlayer.play("Run")
			velocity.y = -1
		elif Input.is_action_pressed("S"):
			$AnimationPlayer.play("Run")
			velocity.y = 1
		if Input.is_action_pressed("ui_select"):
			$AnimationPlayer.play("Attack")
			Attack()



func _process(delta):
	move_and_slide(velocity * speed) 


func Attack():
	attack = true
	$AnimationPlayer.play("Attack")




func _on_AnimationPlayer_animation_finished(anim_name):
		if anim_name  == "Attack":
			$AnimationPlayer.play("Idle")
			attack = false
