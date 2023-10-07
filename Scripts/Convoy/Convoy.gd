extends Node2D

var farmer = preload("res://Scenes/Convoy/ConFarmer.tscn")
var swordmen = preload("res://Scenes/Convoy/ConPlayer.tscn")
var village = false



func _ready():
	GameManager.convoy = self
func _process(delta):
	if village == false:
		position.x += 2
		


func _on_ConvoyArea_area_entered(area):
	if area.is_in_group("Village") or area.is_in_group("Traning"):
		village = true



func village_true():
	village = true
func village_false():
	village = false

func army_plus():
	GameManager.currentarmy += 1
	GameManager.currentfarmer +=1
	var Farmer = farmer.instance()
	add_child(Farmer)
	Farmer.global_position = $SpawnPosition.global_position
	$SpawnPosition.position.x -= 32
	
	
	village = false

func upgrade_swordmen():
	pass
