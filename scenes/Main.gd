extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
#	get_node("Audio_cena1").play()	
	
	pass
func set_process(true):
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$Audio_cena1.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):	
#	
	
