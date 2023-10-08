extends Node2D




func _on_BackButton_pressed():
	get_tree().change_scene("res://Scenes/Menu/Menu.tscn")


func _on_SoundOff_pressed():
	if GameManager.sound == false:
		GameManager.sound = true
		$SoundOff.normal = load("res://Assets/Menu/soun on.png")
		$Label.text = "Music : On"
	else:
		GameManager.sound = false
		$SoundOff.normal = load("res://Assets/Menu/soun off.png")
		$Label.text = "Music : Off"
