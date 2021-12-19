extends Node2D

var enemyScene
var enemyCount = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	enemyScene = load("res://Scenes/Enemy.tscn")
	get_parent().get_node("BeatManager").connect("on_beat", self, "on_beat")
	
func on_beat(beatCount):
	if (beatCount % 8 == 0):
		spawnEnemy()

func spawnEnemy():
	var enemy = enemyScene.instance()
	enemyCount += 1
	enemy.name = "Enemy_" + str(enemyCount)
	add_child(enemy)
