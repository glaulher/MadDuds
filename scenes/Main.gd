extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
#	get_node("Audio_cena1").play()	
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$Audio_cena1.play()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):	
#	
	
