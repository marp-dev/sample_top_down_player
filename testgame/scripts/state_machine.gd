extends KinematicBody2D

var current_state
var states
var stack

# Called when the node enters the scene tree for the first time.
func _ready():
	stack = ['idle']
	states = {
		"idle": global.states.idle.new()
	}
	state_change()

func _input(event):
	current_state.handle_input(event)

func _process(delta):
	current_state.update(delta)

func state_change(state = false, props = {}):
	#if(current_state != null and stack.size() > 1):
	#	current_state.exit()
	#	stack.remove(0)
	
	if(not state or states[state] == null):
		state = stack[0]
	else:
		stack.push_front(state)
	current_state = states[state]
	props['owner'] = self
	current_state.enter(props)
