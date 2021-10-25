extends KinematicBody2D

export var speed = 2
export var damage = 10
export var max_constraint = 100
export var min_constraint = -100
var direction = 1
var score = 100
var velocity = Vector2.ZERO

func _physics_process(delta):
	if direction < 0 and $Sprite.flip_h:
		$Sprite.flip_h = false
	if direction > 0 and !$Sprite.flip_h:
		$Sprite.flip_h = true
	if direction > 0 and position.x >= max_constraint:
		velocity.x = 0
		direction = -1
	if direction < 0 and position.x <= min_constraint:
		velocity.x = 0
		direction = 1
		
	velocity.x += direction * speed
	move_and_slide_with_snap(velocity, Vector2.UP)
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.name == "Ground" or collision.collider.name == "Platforms":
			velocity.x = 0
			direction ^= -1
		if collision.collider.name == "Player":
			collision.collider.do_damage(damage)
		
func die():
	Global.increase_score(score)
	queue_free()

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		body.do_damage(damage)

