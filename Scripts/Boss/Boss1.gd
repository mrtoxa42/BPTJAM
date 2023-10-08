extends KinematicBody2D

var hp = 300
var CurrentAni = "Down"
var veloctiy = Vector2.ZERO
var speed = 200
var playerarea = false

func _ready():
	GameManager.boss1 = self
	

func _process(delta):
	if playerarea == false:
		veloctiy = Vector2(GameManager.player.global_position - global_position).normalized()
		$AnimationPlayer.play("BossMoveRight")
		move_and_slide(veloctiy * speed)
		
	$HealthBar.value = hp
	
	


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Attack":
		if playerarea == true:
			playerarea = true
			$AnimationPlayer.play("Attack")
			GameManager.player.boss_damage()
	else:
		playerarea = false

		


func _on_Area2D_area_entered(area):
	if area.is_in_group("Player"):
		if GameManager.player !=null:
			playerarea = true
			$AnimationPlayer.play("Attack")
			
			GameManager.player.boss_damage()


func take_damage():
	if hp >1 :
		hp -=  5
	else:
		get_tree().change_scene("res://Scenes/Game/FinalScene.tscn")
		queue_free()

func player_damage():
	if hp >1 :
		hp -=  50
	else:
		get_tree().change_scene("res://Scenes/Game/FinalScene.tscn")
		queue_free()
func _on_Area2D_area_exited(area):
	if area.is_in_group("Player"):
			playerarea = false
