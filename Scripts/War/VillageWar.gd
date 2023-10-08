extends Node2D

var farmer = preload("res://Scenes/PSolider/Farmer.tscn")
var swordmen = preload("res://Scenes/PSolider/SwordMen.tscn")
var player = preload("res://Scenes/Player/Player.tscn")



var farmercounter = 0
var swordmencounter = 0


func _ready():
	farmercounter = GameManager.currentfarmer
	swordmencounter = GameManager.currentswordmen
	var Player = player.instance()
	add_child(Player)
	Player.global_position = $SoldierSpawnPosition.global_position
	war_start()
	
	
func war_start():
	if farmercounter >= 1:
		farmercounter -=1
		var Farmer = farmer.instance()
		add_child(Farmer)
		Farmer.global_position =  $SoldierSpawnPosition.global_position
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		var r = rng.randi_range(-200,200)
#		$SoldierSpawnPosition.global_position.x += r
		$SoldierSpawnPosition.global_position.y += r
		war_start()
	
