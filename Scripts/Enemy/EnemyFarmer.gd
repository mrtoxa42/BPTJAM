extends KinematicBody2D


var hp = 3
var speed = 200
var velocity = Vector2.ZERO
var currentenemy
var enemyarea = false
var attack = false
var attackenemy 
func _process(delta):
	if currentenemy !=null and enemyarea == false:
		velocity = Vector2(currentenemy.global_position - global_position).normalized()
		move_and_slide(velocity * speed)



func _on_FarmerArea_area_entered(area):
	pass
		

func _on_FarmerArea_area_exited(area):
	pass


func _on_DetectedArea_area_entered(area):
	if area.is_in_group("Soldier"):
		currentenemy = area
		
		

func _on_DetectedArea_area_exited(area):
	if area.is_in_group("Soldier"):
		if area == currentenemy:
			currentenemy = null


func _on_Area_area_entered(area):
	if area.is_in_group("Soldier"):
		enemyarea = true
		if attackenemy == null:
			attackenemy = area
			Attack()


func _on_Area_area_exited(area):
	if area == attackenemy:
		enemyarea = false


func Attack():
	$AnimationPlayer.play("Attack")
	
	attack = true

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Attack":
		if currentenemy != null:
			pass
		attack = false
		if enemyarea == true:
			Attack()
