extends KinematicBody2D

const GRAVITY = 1000
const SPEED = 200
const JUMP_FORCE = -320

var movement = 0
var velocity = Vector2()
var double_jump = false
var controll = {
	'up': false,
	'down': false,
	'left': false,
	'right': false,
	'jump': false,
	'jump_stop': false
}

func _physics_process(delta):
		velocity.y += GRAVITY * delta	
		set_controll()	
		moviment_map()			
		velocity = move_and_slide(velocity, Vector2(0, -1))	

#function move madduds												
func moviment_map():
		set_direction()
		move_left()
		move_right()
		idle0()	
		jump_and_double_jump()
			
#set control							
func set_controll():
		self.controll['up'] = Input.is_action_pressed('ui_up')
		self.controll['down'] = Input.is_action_pressed('ui_down')
		self.controll['left'] = Input.is_action_pressed('ui_left')
		self.controll['right'] = Input.is_action_pressed('ui_right')
		self.controll['jump'] = Input.is_action_just_pressed('ui_accept') # space bar
		self.controll['jump_stop'] = Input.is_action_just_released('ui_accept') # space bar 
		
#set direction			
func set_direction():
	movement =  -int(self.controll['left']) + int(self.controll['right'])
	
#move left
func move_left():
	if self.controll['left']:
			velocity.x = movement * SPEED
			$Sprite.flip_h = true
			if is_on_floor():
				$Sprite.play('Run')	
				
#move right			
func move_right():
	if self.controll['right']:			
			velocity.x = movement * SPEED
			$Sprite.flip_h = false
			if is_on_floor():
				$Sprite.play('Run')	
				
# sprite idle				
func idle0():
	if movement == 0:
		velocity.x = 0
		if is_on_floor():
			$Sprite.play('Idle')	
			
# function jump			
func jump_and_double_jump():
	if self.controll['jump']:
		if double_jump == true:	
			$Audio_jump.play()					
			velocity.y = JUMP_FORCE	
	if is_on_floor():
		double_jump = true			
	#control 2º jump of double-jump
	elif self.controll['jump_stop'] and velocity.y < 0:
			velocity.y *= 0.5	
	#animation jump and fall		
	else:	
				
		if velocity.y < 0 :
			$Sprite.play('Jump')
		
		else:
			$Sprite.play('Jump_down')		
	# control double jump			
	if double_jump and self.controll['jump'] and !is_on_floor():
		velocity.y = JUMP_FORCE
		double_jump =false	

