extends KinematicBody2D

func _ready():
	GameManager.conplayer = self

func _process(delta):
	$CanvasLayer/Dinar.text = str(GameManager.dinar)



func dinar_down():
	GameManager.dinar -= 20
