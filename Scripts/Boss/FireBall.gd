extends Area2D

var direction = "Left"

func _process(delta):
	if direction == "Left":
		position.x -= 4
	if direction == "Up":
		position.x -= 4
		position.y -= 1
	if direction == "Down":
		position.x -= 4
		position.y += 1

func _on_Timer_timeout():
	queue_free()
