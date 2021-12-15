extends Node2D


var targetPosition = null
var speed = 5
var hopDistance = -100

func _ready():
	hopForward()
	
func onHurt(area):
	print("enemy hurt")
	queue_free()

func hopForward():
	targetPosition = global_position.x + hopDistance

func _process(delta):
	if targetPosition != null:
		global_position.x = lerp(global_position.x, targetPosition, delta * speed)
