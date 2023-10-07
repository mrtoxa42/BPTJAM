extends Node2D



func _ready():
	army_update()


func menu_open():
	pass

func army_update():
	var farmers =  get_node("TraningMenu/Farmers/Farmer"+ str(GameManager.currentfarmer))
	farmers.show()
	
	var swordmen = get_node("TraningMenu/SwordMen/Farmer"+str(GameManager.currentswordmen))
	swordmen.show()
func _on_TraningArea_area_entered(area):
	pass # Replace with function body.


func _on_TraningArea_area_exited(area):
	pass # Replace with function body.


func _on_FarmerUpdateButton_pressed():
	if GameManager.dinar >= 10 and GameManager.currentswordmen < 12 and GameManager.currentfarmer >= 1:
		GameManager.dinar -= 10
		$TraningMenu/DinarLabel.text = "ALTIN:" + str(GameManager.dinar)
		var swordmen = get_node("TraningMenu/SwordMen/Farmer"+str(GameManager.currentswordmen))
		if swordmen != null:
			swordmen.hide()
		var farmers =  get_node("TraningMenu/Farmers/Farmer"+ str(GameManager.currentfarmer))
		if farmers != null:
			farmers.hide()
		
		GameManager.currentfarmer -=1
		GameManager.currentswordmen +=1
		
		var farmers2 =  get_node("TraningMenu/Farmers/Farmer"+ str(GameManager.currentfarmer))
		if farmers2 != null:
			farmers2.show()
		var swordmen2 = get_node("TraningMenu/SwordMen/Farmer"+str(GameManager.currentswordmen))
		if swordmen2 != null:
			swordmen2.show()
