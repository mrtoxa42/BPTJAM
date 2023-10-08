extends Node2D



func _ready():
	army_update()
	pass

func menu_open():
	army_update()
	$TraningMenu.show()
func menu_close():
	$TraningMenu.hide()
func army_update():
	var farmers =  get_node("TraningMenu/Farmers/Farmer"+ str(GameManager.currentfarmer))
	if farmers != null:
		farmers.show()
	
	var swordmen = get_node("TraningMenu/SwordMen/Farmer"+str(GameManager.currentswordmen))
	if swordmen !=null:
		swordmen.show()
func _on_TraningArea_area_entered(area):
	if area.name == "ConvoyArea":
		menu_open()


func _on_TraningArea_area_exited(area):
	pass # Replace with function body.


func _on_FarmerUpdateButton_pressed():
	if GameManager.dinar >= 10 and GameManager.currentswordmen < 12 and GameManager.currentfarmer >= 1:
		GameManager.convoy.upgrade_swordmen()
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
	else:
		if GameManager.dinar < 10:
			$AnimationPlayer.play("DinarError")
		elif GameManager.currentfarmer < 1:
			$AnimationPlayer.play("FarmerError")


func _on_Close_pressed():
	menu_close()
	GameManager.movevillage = false


func _on_SwordMenUpdateButton_pressed():
	if GameManager.dinar >= 15 and GameManager.currentswordmen < 12 and GameManager.currentfarmer >= 1:
		GameManager.convoy.upgrade_swordmen()
		GameManager.dinar -= 15
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
	else:
		if GameManager.dinar < 10:
			$AnimationPlayer.play("DinarError")
		elif GameManager.currentfarmer < 1:
			$AnimationPlayer.play("FarmerError")
