extends KinematicBody2D

func _ready():
	GameManager.conplayer = self

func _process(delta):
	$CanvasLayer/Dinar.text = "ALTIN: " + str(GameManager.dinar)
	if GameManager.convoy.village == false:
		$AnimatedSprite.play("Walk")
	else:
		$AnimatedSprite.play("Idle")


func dinar_down():
	GameManager.dinar -= 20
