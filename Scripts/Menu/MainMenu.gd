extends Node2D




func _on_PlayButton_pressed():
	get_tree().change_scene("res://Scenes/Menu/StartStory.tscn")
	


func _on_Creadits_pressed():
	get_tree().change_scene("res://Scenes/Menu/Creadits.tscn")


func _on_Settings_pressed():
	get_tree().change_scene("res://Scenes/Menu/Settings.tscn")

