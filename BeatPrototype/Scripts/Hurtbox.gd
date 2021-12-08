extends Area2D

func _on_Hurtbox_area_entered(area):
	if get_parent().has_method("onHurt"):
		get_parent().onHurt(area)
	else:
		print("Error, parent has no on hit method")
