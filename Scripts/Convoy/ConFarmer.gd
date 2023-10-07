extends KinematicBody2D

func _ready():
	GameManager.selffarmer = self
	
	
func _process(delta):
	if GameManager.selffarmer == null:
		GameManager.selffarmer = self
	if GameManager.convoy.village == false:
		$AnimationPlayer.play("Walk")
	else:
		$AnimationPlayer.play("Idle")
func destroyed():
	if GameManager.selffarmer == self:
		GameManager.selffarmer = null
		queue_free()
