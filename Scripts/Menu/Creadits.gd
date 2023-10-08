extends Node2D




func _on_BackButton_pressed():
	get_tree().change_scene("res://Scenes/Menu/Menu.tscn")


func _on_TouchScreenButton_pressed():
	OS.shell_open("https://www.instagram.com/studyo42/")


func _on_TouchScreenButton2_pressed():
	OS.shell_open("https://studyo42.itch.io/")

func _on_TouchScreenButton3_pressed():
	OS.shell_open("https://discord.gg/WE8GjVrCTT%22")

func _on_TouchScreenButton4_pressed():
	OS.shell_open("https://42studyo42.com/%22")
