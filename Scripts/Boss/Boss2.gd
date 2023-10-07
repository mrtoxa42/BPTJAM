extends KinematicBody2D


var PlayerAttack = false
var fireball = preload("res://Scenes/Boss/FireBall.tscn")
var hp = 50





func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "GirisAni":
		PlayerAttack = true

func Attack():
	var Fireball = fireball.instance()
	get_tree().get_root().add_child(Fireball)
	Fireball.global_position = $ShootPosition.global_position
	if hp < 100 :
		var Fireball2 = fireball.instance()
		get_tree().get_root().add_child(Fireball2)
		Fireball2.global_position = $ShootPosition2.global_position
		Fireball2.direction = "Down"
		var Fireball3 = fireball.instance()
		get_tree().get_root().add_child(Fireball3)
		Fireball3.global_position = $ShootPosition3.global_position
		Fireball3.direction = "Up"
		
	


func _on_AttackTimer_timeout():
	Attack()
