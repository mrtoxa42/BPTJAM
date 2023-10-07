extends Node2D




func _on_Play_Button_pressed():
	get_tree().change_scene("res://Scenes/Game/MainGame.tscn")


func _on_Settings_pressed():
	 get_tree().change_scene("res://Scenes/Menu/Settings.tscn")


func _on_Creadits_pressed():
	get_tree().change_scene("res://Scenes/Menu/Creadits.tscn")
