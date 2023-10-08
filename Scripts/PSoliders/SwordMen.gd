extends KinematicBody2D


var hp = 14
var speed = 200
var velocity = Vector2.ZERO
var currentenemy
var enemyarea = false
var attack = false
var attackenemy 
func _process(delta):
	if currentenemy !=null and enemyarea == false:
		$AnimationPlayer.play("Walk")
		velocity = Vector2(currentenemy.global_position - global_position).normalized()
		move_and_slide(velocity * speed)
	$ProgressBar.value = hp
#func _on_FarmerArea_area_entered(area):
#	if area.is_in_group("Enemy"):
#		enemyarea = true
#		if attackenemy == null:
#			attackenemy = area
#			Attack()
		
#
#func _on_FarmerArea_area_exited(area):
#	if area == attackenemy:
#		enemyarea = false


func _on_DetectedArea_area_entered(area):
	if area.is_in_group("Enemy"):
		currentenemy = area
		
		

func _on_DetectedArea_area_exited(area):
	if area.is_in_group("Enemy"):
		if area == currentenemy:
			currentenemy = null

func Attack():
	$AnimationPlayer.play("Attack")
	if attackenemy != null:
		attackenemy.take_damage()
		attack = true

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Attack":
		attack = false
		if enemyarea == true:
			Attack()
			
func take_damage():
	
	if hp > 1:
		hp -=1
	else:
		queue_free()





func _on_FarmerArea_body_entered(body):
	if body.is_in_group("Enemy"):
		enemyarea = true
		if attackenemy == null:
			attackenemy = body
			Attack()


func _on_FarmerArea_body_exited(body):
	if body == attackenemy:
		enemyarea = false
		attackenemy = null
		$AnimationPlayer.play("Detected")


func _on_FarmerArea_area_entered(area):
	pass # Replace with function body.


func _on_FarmerArea_area_exited(area):
	pass # Replace with function body.
