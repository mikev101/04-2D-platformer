extends Node2D

onready var Player = load("res://Player/Player.tscn")
var starting_position = Vector2(100,300)


func _physics_process(_delta):
	if not has_node("Player"):
		var player = Player.instance()
		player.position = starting_position
		add_child(player)

func spawn(p):
	var player = Player.instance()
	player.position = p
	player.name = "Player"
	add_child(player)
	var children = get_children()
	for c in children:
		print(c.name)
