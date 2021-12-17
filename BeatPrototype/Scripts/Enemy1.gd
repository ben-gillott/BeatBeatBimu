extends Node2D


var targetPosition = null
var speed = 5
var hopDistance = -40

func _ready():
	get_parent().get_parent().get_node("BeatManager").connect("on_beat", self, "enemy_on_beat")
	
func onHurt(area):
	print("enemy hurt")
	queue_free()
	
func enemy_on_beat(beatCount):
	if(beatCount%2 == 1): #Move forward every other beat
		hopForward()

func hopForward():
	targetPosition = global_position.x + hopDistance

func _process(delta):
	if targetPosition != null:
		global_position.x = lerp(global_position.x, targetPosition, delta * speed)
