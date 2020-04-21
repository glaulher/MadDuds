extends KinematicBody2D

const GRAVITY = 300
const UP = Vector2(0, -1)
const SPEED = 100
const JUMP = 100

var motion = Vector2()
var dir = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !is_on_floor():
		motion.y +=  GRAVITY * delta
		
	if Input.is_action_pressed("ui_right"):
		dir = 1
		$Sprite.flip_h = false
		motion.x = SPEED * dir	
		if is_on_floor():
			$Sprite.play("Run") 
	move_and_slide(motion, UP)
	pass
