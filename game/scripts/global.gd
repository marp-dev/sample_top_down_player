extends Node


const DEBUG = true

var weapons
var pointer

func _ready():
	
	weapons = {}
	weapons.weapon = preload('../scenes/weapon.tscn')

