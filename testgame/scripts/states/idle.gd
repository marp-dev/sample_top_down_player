extends Node

signal finished(next_state_name)

var UP
var motion
var parent

# Initialize the state. E.g. change the animation
func enter(props = {}):
	name = "STATE_IDLE"
	parent = owner
	if props['owner']:
		parent = props['owner']
	UP = Vector2(0,-1)
	motion = Vector2()
	motion.x = 0
	motion.y = 0
	
# Clean up the state. Reinitialize values like a timer
func exit():
	pass

func handle_input(event):
	pass

func update(delta):
	parent.move_and_slide(motion, UP)

#func _on_animation_finished(anim_name):
#	return
