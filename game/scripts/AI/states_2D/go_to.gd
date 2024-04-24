extends Node

signal finished(ref)

var UP
var motion
var parent
var target_node
var target
var invalid = false

# Initialize the state. E.g. change the animation
func enter(props = {}):
	name = "STATE_GOTO"
	parent = owner
	if props['owner']:
		parent = props['owner']
	if typeof(props['target']) == TYPE_NODE_PATH:
		target_node = parent.get_node(props['target'])
		target = target_node.global_position
	elif typeof(props['target']) == TYPE_VECTOR2:
		target_node = null
		target = props['target']
	else:
		invalid = true
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
	if invalid:
		return false;
	
	if parent.global_position.distance_to(target) < 2:
		finished.emit(name)
	
	var direction = (target - parent.global_position).normalized()
	var motion = direction * parent.SPEED * delta
	parent.set_velocity(motion)
	parent.move_and_slide()


#func _on_animation_finished(anim_name):
#	return