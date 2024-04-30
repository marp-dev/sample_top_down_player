extends Node2D


signal log_all(text, ref)


func _ready():
	if not global.DEBUG:
		return
	var logging = preload("res://scenes/Logging.tscn")
	for unit in [$player]:
		var logger = logging.instantiate()
		unit.add_child(logger)
		logger.offset_position = Vector2(80,-80)
		var log_text_call = func(text, ref):
			log_text(text, ref)
		log_all.connect(log_text_call.bind(logger))


func log_text(text, ref):
	ref.text += text


func _process(delta):
	if not global.DEBUG:
		return
	$player.get_node('Logging').text += 'states:\n'
	for state in $player.current_states():
		$player.get_node('Logging').text += "- %s\n" % state

