extends KinematicBody2D


var hp = 14
var speed = 200
var velocity = Vector2.ZERO
var currentenemy 
var moveenemy 

func _process(delta):
	if moveenemy !=null:
		velocity = Vector2(moveenemy.global_position - global_position).normalized()
		move_and_slide(velocity * speed)
	$ProgressBar.value = hp

		


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Attack":
		if currentenemy != null:
			currentenemy.take_damage()
			Attack()

func Attack():
	$AnimationPlayer.play("Attack")


func _on_FarmerArea_body_entered(body):
	if body.is_in_group("Soldier"):
		currentenemy = body
		Attack()


func _on_FarmerArea_body_exited(body):
	if body == currentenemy:
		currentenemy = null


func _on_DetectedArea_area_entered(area):
	if area.is_in_group("Soldier"):
		if moveenemy == null:
			moveenemy = area
func take_damage():
	if hp > 1:
		hp -=2
	else:
		queue_free()


func _on_DetectedArea_area_exited(area):
	if area == moveenemy:
		moveenemy = null
