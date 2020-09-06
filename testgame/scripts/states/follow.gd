extends Node

signal finished(next_state_name)

#var UP
var logging
var parent
var target

# Initialize the state. E.g. change the animation
func enter(props = {}):
	name = "STATE_FOLLOW"
	parent = owner
	if props['owner']:
		parent = props['owner']
	if parent.get('follow_to') != null:
		target = parent.get_node(parent.follow_to)

# Clean up the state. Reinitialize values like a timer
func exit():
	pass

func handle_input(event):
	pass

func update(delta):
	if target:
		var motion
		var direction = (target.global_position - parent.global_position).normalized()
		motion = direction * parent.SPEED
		parent.move_and_slide(motion)

#func _on_animation_finished(anim_name):
#	return
