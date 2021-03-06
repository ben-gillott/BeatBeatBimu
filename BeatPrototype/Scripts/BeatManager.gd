extends Node2D

var bpm = 100.0 #Tombtorial is 100bpm
var spb = 60.0/bpm

var beatRangeTolerance = .2 #In beat to one side
var beatLoopLength = 8

var isBeating = false
var time = 0.0 #Dont reset this, make sure to keep in time with song.

#Local use
var beat
var beatLoopCount #Where in the beat loop it is
var beatOffset #how far away from nearest beat, in beats
var nearestBeat
var lastWholeBeat = 0

signal on_beat(beatCount)

func _ready():
	startBeat()

func startBeat():
	$MusicPlayer.playing = true

func _process(delta):
	var time = $MusicPlayer.get_playback_position() + AudioServer.get_time_since_last_mix()
	time -= AudioServer.get_output_latency()
	
	beat = time/spb
	
	nearestBeat = int(round(beat))
	beatLoopCount = nearestBeat % beatLoopLength
	beatOffset = (beat - nearestBeat)
	
	#If beat float is within range - is beating
	if abs(beatOffset) < beatRangeTolerance:
		isBeating = true
	else:
		isBeating = false
	
	if (beat > lastWholeBeat + 1):
		lastWholeBeat = nearestBeat
		emit_signal("on_beat", beatLoopCount)
	
func getIsBeating():
	return isBeating

func getBeatOffset():
	return beatOffset

func printCurrent():
	print("time: " + str(time))
	print("beat: " + str(beat))
	print("nearest: " + str(nearestBeat))
	print("beat count: " + str(beatLoopCount))
	print("offset: " + str(beatOffset))
	print("\n")
	
