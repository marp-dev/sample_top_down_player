extends 'fifo_state_machine_2D.gd'

var current_weapon

func _ready():
	super._ready()
	add_to_group("player")

func _input(event):
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down"):
		state('STATE_MOVEMENT')
	else:
		state('STATE_IDLE')
	if current_weapon and Input.is_action_just_pressed("ui_fire"):
		current_weapon.fire()
	super._input(event)

func _process(delta):
	look_at(get_global_mouse_position())
	super._process(delta)

func add_weapon(weapon):
	if not weapon.is_in_group('weapon'):
		weapon.queue_free()
		return false
	current_weapon = weapon
	current_weapon.weilder = self
	$Weapons.add_child(current_weapon)
	current_weapon.position = $RHandHold.position
	current_weapon.rotation = 0
	return true
