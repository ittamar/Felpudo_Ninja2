extends Node2D
onready var fruits = get_node("Fruits")
var limao = preload("res://scenes/Limao.tscn")
var orange = preload("res://scenes/Orange.tscn")
var pear = preload("res://scenes/Pear.tscn")

func _ready():
	pass # Replace with function body.





func _on_Generator_timeout():
	for i in range(0, rand_range(0,4)):
		var type = int (rand_range(0,5))
		var obj
		if type == 0:
			obj = limao.instance()
		elif type == 1:
			obj = orange.instance()
		elif type == 2:
			obj = pear.instance()
		elif type > 2:
			obj = limao.instance()	
		obj.born(Vector2(rand_range(200,1080),510))
		fruits.add_child(obj)	
