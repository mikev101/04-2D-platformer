extends KinematicBody2D


var locations = [
	#position
	Vector2(1025,121),
	Vector2(1460, 121)
]
var pos = 0
var duration = 3.0

func _ready():
	$Timer.start()


func _on_Timer_timeout():
	$Tween.interpolate_property(self, "position", locations[pos], locations[wrapf(pos+1,0,locations.size())], duration, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	$Tween.start()


func _on_Tween_tween_completed(object, key):
	pos = wrapf(pos+1,0,locations.size())
	$Timer.start()
