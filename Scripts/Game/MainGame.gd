extends Node2D

var convoy = preload("res://Scenes/Convoy/Convoy.tscn")


func _ready():
	var Convoy = convoy.instance()
	add_child(Convoy)
	var a = get_node("CheckPoint/CheckPoint" + str(GameManager.checkpoint))
	print(a)
	Convoy.global_position = a.global_position 
		


func _on_Area2D_area_entered(area):
	if area.is_in_group("Player"):
		get_tree().change_scene("res://Scenes/Boss/BossFight.tscn")
