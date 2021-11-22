extends Node2D

var isOverlapping = false
var dragging = false

func _ready():
	print("hello world")
	




func _on_Area2D_input_event(viewport, event, shape_idx):
	#print("input")
	if not Globalstate.numbersenabled:
		return
		
	if Globalstate.draging_something and not dragging:
		return
		
	if event is InputEventScreenTouch:
		print("touch10")
		if event.pressed:
			Globalstate.draging_something = true
			dragging  = true
		else:
			Globalstate.draging_something = false
			dragging = false


		#print(self.position)
		print(event.pressed)
		print(dragging)
		
	elif event is InputEventScreenDrag and Globalstate.draging_something and dragging:
		self.position = event.get_position()



func _on_Area2D_area_entered(area):
	isOverlapping = true


func _on_Area2D_area_exited(area):
	isOverlapping = false
