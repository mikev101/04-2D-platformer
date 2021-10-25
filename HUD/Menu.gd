extends Control

func _on_Continue_pressed():
	pass

func _on_Save_pressed():
	Global.save_game(0)

func _on_Load_pressed():
	Global.load_game(0)


func _on_Quit_pressed():
	get_tree().quit()
