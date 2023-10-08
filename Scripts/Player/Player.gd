extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = 200
var attack = false
var hp = 100
var currentenemy

func _ready():
	GameManager.player = self


func _input(event):
	velocity = Vector2.ZERO
	if attack == false:
		if Input.is_action_pressed("A"):
			$Sprite2.offset.x = -61
			$Sprite3.offset.x = -61
			$Sprite2.flip_h = true
			$Sprite3.flip_h = true
			velocity.x = -1
			$AnimationPlayer.play("RunL")
			
		elif Input.is_action_pressed("D"):
			$Sprite2.offset.x = 0
			$Sprite2.flip_h = false
			$Sprite3.offset.x = 0
			$Sprite3.flip_h = false
			$AnimationPlayer.play("RunR")
			velocity.x = 1
		if Input.is_action_pressed("W"):
			$AnimationPlayer.play("RunR")
			velocity.y = -1
		elif Input.is_action_pressed("S"):
			$AnimationPlayer.play("RunL")
			velocity.y = 1
		if velocity == Vector2.ZERO:
			$AnimationPlayer.play("Idle")
		if Input.is_action_pressed("ui_select") and attack == false:
			$AnimationPlayer.play("Attack")
			Attack()
		



func _process(delta):
	move_and_slide(velocity * speed) 
	$ProgressBar.value = hp
func Attack():
	attack = true
	$AnimationPlayer.play("Attack")




func _on_AnimationPlayer_animation_finished(anim_name):
		if anim_name  == "Attack":
			$AnimationPlayer.play("Idle")
			if currentenemy !=null:
				currentenemy.take_damage()
			attack = false


func _on_PlayerArea_body_entered(body):
	if body.is_in_group("Enemy"):
		currentenemy = body
		print(body)

	
func _on_PlayerArea_body_exited(body):
	if body.is_in_group("Enemy"):
		if body == currentenemy:
			currentenemy = null

func take_damage():
	if hp >1 :
		hp -=1
	else:
		game_over()
		
func game_over():
	pass
