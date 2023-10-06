extends Node

var hp = 300
var CurrentAni = "Down"


func _ready():
	pass # Replace with function body.
	

func _process(delta):
	$HealthBar.value = hp
	



func _on_AnimationPlayer_animation_finished(anim_name):
	if  anim_name == "BossMoveDown":
		$AnimationPlayer.play("Attack")
		CurrentAni = "Down"
	if anim_name == "BossMoveRight" :
		$AnimationPlayer.play("Attack")
		CurrentAni = "Right"
	if anim_name == "BossMoveUp" :
		$AnimationPlayer.play("Attack")
		CurrentAni = "Up"
	if anim_name == "BossMoveLeft" :
		$AnimationPlayer.play("Attack")
		CurrentAni = "Left"
		
		
	if anim_name == "GirisAni":
		$AnimationPlayer.play("BossMoveDown")
		

	if anim_name == "Attack":
		if CurrentAni == "Down":
			$AnimationPlayer.play("BossMoveRight")
		if CurrentAni == "Right":
			$AnimationPlayer.play("BossMoveUp")
		if CurrentAni == "Up":
			$AnimationPlayer.play("BossMoveLeft")
		if CurrentAni == "Left" :
			$AnimationPlayer.play("BossMoveDown")
		
