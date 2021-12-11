extends Node2D


var bpm = 100.0
var spb = 60.0/bpm

var beat = 0
var beatLoopLength = 4

var time = 0.0 #Dont reset this, make sure to keep in time with song.

# Called when the node enters the scene tree for the first time.
func _ready():
	spb = 60/bpm
	pass # Replace with function body.

func startBeat():
	time = 0
	$MusicPlayer.playing = true

func _process(delta):
	time += delta
	beat = time/spb
	print("time: " + str(time))
	print("beat: " + str(beat))
