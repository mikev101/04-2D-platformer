extends Node2D

onready var Enemy_Flying = load("res://Enemy/Enemy_Flying.tscn")
onready var Enemy_Ground = load("res://Enemy/Enemy_Ground.tscn")
#onready var Enemy_Mines = load("res://Enemy/Enemy_Mines.tscn")

var Spawn_Point = Vector2(2000,-360)

func _physics_process(_delta):
	var count = 0
	var children = get_children()
	for c in children:
		if c.is_in_group("Enemy_Flying"):
			count += 1
	if count == 0:
		spawn("Enemy_Flying",{},Spawn_Point)

func spawn(e_type, attr, p):
	var enemy = null
	if e_type == "Enemy_Ground":
		enemy = Enemy_Ground.instance()
	if e_type == "Enemy_Flying":
		enemy = Enemy_Flying.instance()
	for a in attr:
		enemy[a] = attr[a]
	enemy.position = p
	add_child(enemy)
#	if e_type == "Enemy_Mines":
#		enemy = Enemy_Flying.instance()

