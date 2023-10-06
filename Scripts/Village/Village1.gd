extends Node2D






func _on_Area2D_mouse_entered():
	$Box/LabelOne.modulate = Color.green


func _on_Area2D_mouse_exited():
	$Box/LabelOne.modulate = Color.white

