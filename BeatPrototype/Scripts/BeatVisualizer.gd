extends Node2D

onready var centerScaleStart = $Center.scale
var centerScaleUpRatio = 1.5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if get_parent().getIsBeating():
		centerIsBeating()
	else:
		centerIsNotBeating()
	#manually check parent isBeating and call sub funcs accordingly
	pass

func centerIsBeating():
	$Center.modulate = Color(.5,1,.5)
	$Center.scale = centerScaleStart * centerScaleUpRatio

func centerIsNotBeating():
	$Center.modulate = Color(1,1,1)
	$Center.scale = centerScaleStart
	

