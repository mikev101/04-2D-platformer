extends ColorRect

var increase = 0
signal faded_in
signal faded_out

func _ready():
	pass


func _physics_process(_delta):
	color.a = clamp(color.a + increase, 0, 1)
	if color.a == 1:
		increase = 0
		emit_signal("faded_out")
	if color.a == 0:
		increase = 0
		emit_signal("faded_in")

func fade_in():
	increase = -0.01
	color.a = 0.999
	
func fade_out():
	increase = 0.01
	color.a = 0.001
