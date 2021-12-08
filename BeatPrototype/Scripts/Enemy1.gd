extends Node2D

func onHurt(area):
	print("enemy hurt")
	queue_free()
