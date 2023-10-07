extends KinematicBody2D

func _ready():
	GameManager.selffarmer = self
	
	
func _process(delta):
	if GameManager.selffarmer == null:
		GameManager.selffarmer = self
func destroyed():
	if GameManager.selffarmer == self:
		GameManager.selffarmer = null
		queue_free()
