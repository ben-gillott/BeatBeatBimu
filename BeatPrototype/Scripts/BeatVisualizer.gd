extends Node2D

onready var centerScaleStart = $Center.scale
var centerScaleUpRatio = 1.5

# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().connect("on_beat", self, "visualizeBeat")

func visualizeBeat(beatCount):
	centerIsBeating()
	yield(get_tree().create_timer(.1), "timeout")
	centerIsNotBeating()

func centerIsBeating():
	$Center.modulate = Color(.5,1,.5)
	$Center.scale = centerScaleStart * centerScaleUpRatio

func centerIsNotBeating():
	$Center.modulate = Color(1,1,1)
	$Center.scale = centerScaleStart
	

