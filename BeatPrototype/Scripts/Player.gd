extends KinematicBody2D

export (int) var speed = 350
export (int) var jump_speed = -500
export (int) var gravity = 500
export (float, 0, 1.0) var friction = 0.3
export (float, 0, 1.0) var acceleration = 0.30

enum {
	MOVE,
	ATTACK,
	JUMP
}
var state = MOVE
var velocity = Vector2.ZERO
var dir = 0

onready var originalScaleX = scale.x
onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")


func _ready():
	animationTree.active = true


func _physics_process(delta):
	match(state):
		MOVE:
			move_state(delta)
		JUMP:
			pass
		ATTACK:
			attack_state(delta)


func move_state(delta):
	var inputX = 0
	inputX = Input.get_action_strength("player_right") - Input.get_action_strength("player_left")
	
	if inputX != 0: #Moving
		#Flip Sprite
		if inputX < 0:
			$Sprite.scale.x = -1
		else:
			$Sprite.scale.x = 1
		
		animationState.travel("run")
		
		velocity.x = lerp(velocity.x, inputX * speed, acceleration)
	else:
		animationState.travel("idle")
		velocity.x = lerp(velocity.x, 0, friction)
		
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if Input.is_action_just_pressed("player_attack"):
		state = ATTACK

func attack_state(delta):	
	velocity = Vector2.ZERO
	animationState.travel("attack_2")


func attack_animation_finished():
	state = MOVE
	
func onHurt(area):
	print("player hurt")
	
