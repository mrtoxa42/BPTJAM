extends Node2D

var farmer = preload("res://Scenes/PSolider/Farmer.tscn")
var swordmen = preload("res://Scenes/PSolider/SwordMen.tscn")
var player = preload("res://Scenes/Player/Player.tscn")

var countenemy = 10

var farmercounter = 0
var swordmencounter = 0


func _ready():
	GameManager.villagewar = self
	farmercounter = GameManager.currentfarmer
	swordmencounter = GameManager.currentswordmen
	var Player = player.instance()
	add_child(Player)
	Player.global_position = $SoldierSpawnPosition.global_position
	war_start()
	
func _process(delta):
	if GameManager.enemycounter== 0:
		GameManager.movevillage = false
		GameManager.dinar += 20
		GameManager.enemycounter = 10
		get_tree().change_scene("res://Scenes/Game/MainGame.tscn")
		queue_free()
	
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
	
