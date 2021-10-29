extends Node2D

onready var limit = get_node("Limit")
onready var inter = get_node("Inter")

var pressed = false
var drag = false
var curpos = Vector2(0,0)
var prepos = Vector2(0,0)

func _ready():
	set_process_input(true)
	set_physics_process(true)

func _physics_process(delta):	
	if drag and curpos != prepos and prepos != Vector2(0,0):
		var space_state = get_world_2d().get_direct_space_state()
		var result = space_state.intersect_ray(prepos, curpos)
		if not result.empty():
			print("www")
			result.collider.cut()
	

func _input(event):
	event = make_input_local(event)
	
	if event is InputEventScreenTouch:
		if event.pressed:
			pressed(event.pos)
		else:
			released()
	elif event is InputEventScreenDrag:
		drag(event.pos)
	
func pressed(pos):
	pressed = true
	prepos = pos
	limit.start()
	inter.start()

func released():
	pressed = false
	drag = false
	limit.stop()
	inter.stop()
	prepos = Vector2(0,0)
	curpos = Vector2(0,0)
func drag(pos):
	curpos = pos
	drag = true

func _on_Inter_timeout():
	prepos = curpos


func _on_Limit_timeout():
	released()
