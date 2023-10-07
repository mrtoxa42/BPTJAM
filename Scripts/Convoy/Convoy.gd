extends Node2D

var farmer = preload("res://Scenes/Convoy/ConFarmer.tscn")
var village = false



func _ready():
	GameManager.convoy = self
func _process(delta):
	if village == false:
		position.x += 2
		


func _on_ConvoyArea_area_entered(area):
	if area.is_in_group("Village"):
		village = true



func village_true():
	village = true
func village_false():
	village = false

func army_plus():
	GameManager.currentarmy += 1
	GameManager.currentfarmer +=1
	var armycount =  get_node("Soldier" + str(GameManager.currentarmy))
	var Farmer = farmer.instance()
	add_child(Farmer)
	Farmer.global_position = armycount.global_position
	village = false

