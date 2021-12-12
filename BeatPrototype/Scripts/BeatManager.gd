extends Node2D


var bpm = 100.0 #Tombtorial is 100bpm
var spb = 60.0/bpm

var beatRangeTolerance = .1 #In beat to one side
var beatLoopLength = 4

var isBeating = false
var time = 0.0 #Dont reset this, make sure to keep in time with song.
var beat = 0

#Local use
var beatLoopCount
var beatOffset #how far away from nearest beat, in beats
var nearestBeat

func _ready():
	startBeat()

func startBeat():
	time = 0
	$MusicPlayer.playing = true

func _process(delta):
	time += delta
	beat = time/spb
	
	nearestBeat = int(round(beat))
	beatLoopCount = nearestBeat % beatLoopLength
	beatOffset = abs(nearestBeat - beat)
	
	#If beat float is within range - is beating
	if beatOffset < beatRangeTolerance:
		isBeating = true
	else:
		isBeating = false
	
	#printCurrent()
	#if changes - trigger signal?
	
	
func printCurrent():
	print("time: " + str(time))
	print("beat: " + str(beat))
	print("nearest: " + str(nearestBeat))
	print("beat count: " + str(beatLoopCount))
	print("offset: " + str(beatOffset))
	print("\n")
	
