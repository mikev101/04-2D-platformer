extends KinematicBody2D


export var damage = 100

func _physics_process(delta):
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.name == "Player":
			collision.collider.do_damage(damage)
		
func die():
	pass

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		body.do_damage(damage)

