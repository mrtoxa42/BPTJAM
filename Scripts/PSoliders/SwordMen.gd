extends KinematicBody2D




var hp = 30
var speed = 200
var velocity = Vector2.ZERO
var currentenemy
var enemyarea = false

func _process(delta):
	if currentenemy !=null:
		velocity = Vector2(currentenemy.global_position - global_position).normalized()
	move_and_slide(velocity * speed)






func _on_DetectedArea_area_entered(area):
	if area.is_in_group("Enemy"):
		currentenemy = area
		
		

func _on_DetectedArea_area_exited(area):
	if area.is_in_group("Enemy"):
		if area == currentenemy:
			currentenemy = null


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Attack":
		pass
