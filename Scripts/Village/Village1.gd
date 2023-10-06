extends Node2D






func _on_Area2D_mouse_entered():
	$Box/LabelOne.modulate = Color.green


func _on_Area2D_mouse_exited():
	$Box/LabelOne.modulate = Color.white



func _on_Area2D2_mouse_entered():
	$Box/LabelTwo.modulate = Color.green
	


func _on_Area2D2_mouse_exited():
	$Box/LabelTwo.modulate = Color.white


func _on_Area2D3_mouse_entered():
	$Box/LabelTwo2.modulate = Color.green
	
	

func _on_Area2D3_mouse_exited():
	$Box/LabelTwo2.modulate = Color.white


func _on_VillageArea_area_entered(area):
	if area.name == "ConvoyArea":
		$Box.show()

func gather_men():
	$Box/LabelOne.modulate = Color.white
	$Box.hide()
func plunder():
	$Box/LabelTwo.modulate = Color.white
	$Box.hide()
func keep_going():
	GameManager.convoy.village_false()
	$Box.hide()
	$Box/LabelTwo2.modulate = Color.white

func _on_TouchScreenButton_pressed():
	gather_men()
func _on_TouchScreenButton2_pressed():
	plunder()
func _on_TouchScreenButton3_pressed():
	keep_going()
