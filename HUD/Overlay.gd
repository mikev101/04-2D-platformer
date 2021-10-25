extends ColorRect

var trauma = 0.0
var decay = 0.01

func _ready():
	pass

func _physics_process(_delta):
	color.a = trauma
	trauma = clamp(trauma - decay, 0, 1)

func add_trauma(t):
	trauma = clamp(trauma + t, 0, 1)
