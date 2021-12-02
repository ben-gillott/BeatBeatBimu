extends KinematicBody2D

export (int) var speed = 500
export (int) var jump_speed = -500
export (int) var gravity = 500
export (float, 0, 1.0) var friction = 0.2
export (float, 0, 1.0) var acceleration = 0.50

var velocity = Vector2.ZERO
var dir = 0;
onready var stateMachine = $AnimationTree.get("parameters/playback")

var isAttacking = false

func get_input():
	dir = 0
	if Input.is_action_pressed("player_right"):
		dir += 1
	if Input.is_action_pressed("player_left"):
		dir -= 1

		
	if dir != 0:
		velocity.x = lerp(velocity.x, dir * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0, friction)
	
	
	#Handle Animations
	var currentState = stateMachine.get_current_node()
	
	if Input.is_action_just_pressed("player_attack"):
		stateMachine.travel("attack_2")
	elif(dir != 0): #Running
		stateMachine.travel("run")
		if(dir == 1): #face left
			$Sprite.flip_h = false
		if(dir == -1): #face right
			$Sprite.flip_h = true
	else: #Stopped
		stateMachine.travel("idle")
		
	

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("player_jump"):
		if is_on_floor():
			velocity.y = jump_speed
			
	
		
