extends Node2D



func _on_Hurtbox_area_entered(area):
	print("enemy hurt")
	queue_free()
