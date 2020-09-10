extends Node

signal finished(next_state_name)

var UP
var motion
var parent
var target

# Initialize the state. E.g. change the animation
func enter(props = {}):
	name = "STATE_GOTO"
	parent = owner
	if props['owner']:
		parent = props['owner']
	if props['target'] != null:
		target = parent.get_node(props['target'])
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
	if target:
		var motion
		var direction = (target.global_position - parent.global_position).normalized()
		motion = direction * parent.SPEED
		parent.move_and_slide(motion)


#func _on_animation_finished(anim_name):
#	return
