extends KinematicBody2D

var current_state
var states

# Called when the node enters the scene tree for the first time.
func _ready():
	states = {
		"idle": global.states.idle.new()
	}
	state_change()

func _input(event):
	current_state.handle_input(event)

func _process(delta):
	current_state.update(delta)

func state_change(state = "idle"):
	current_state = states[state]
	current_state.enter({ "owner": self })
