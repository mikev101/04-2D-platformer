extends Area2D



func _ready():
	pass


func _on_Kill_Box_body_entered(body):
	if body.name == "Player":
		body.die()

func die():
	pass
