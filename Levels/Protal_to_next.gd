extends Area2D


func _ready():
	pass

func _on_Protal_to_next_body_entered(body):
	if body.name == "Player":
		if name == "Protal_to_2":
			Global.level = 1
			get_tree().change_scene("res://Levels/level2.tscn")
		if name == "Protal_to_3":
			Global.level = 2
			get_tree().change_scene("res://Levels/level3.tscn")
		if name == "Protal_to_End":
			Global.level = 3
			get_tree().change_scene("res://Levels/Win.tscn")
		if Global.level < Global.levels.size():
			get_tree().change_scene(Global.levels[Global.level])
		#else:
			#get_tree().change_scene("res://Levels/Game_Over.tscn")
