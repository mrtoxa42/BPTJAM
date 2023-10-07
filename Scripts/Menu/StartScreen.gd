extends Node2D




func _on_StudyoAni_animation_finished(anim_name):
	get_tree().change_scene("res://Scenes/Menu/Menu.tscn")
