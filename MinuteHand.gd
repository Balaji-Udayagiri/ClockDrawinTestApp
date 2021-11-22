extends Node2D

var isOverlapping = false
var dragging = false

func _ready():
	print("hello world")
	



func _on_Area2D_input_event(viewport, event, shape_idx):
	#print("input")
	if not Globalstate.minuteenabled:
		print("returning minut hand")
		return
		
	if event is InputEventScreenDrag:
		var x = event.get_position().x - 540.0
		var y = event.get_position().y - 1170.0
		var angle = atan2(y,x)
		self.set_rotation(angle)
		var newcentre = Vector2(540 + 120*cos(angle),1170+120*sin(angle))
		self.set_position(newcentre)
		print(x)
		print(y)



func _on_Area2D_area_entered(area):
	isOverlapping = true


func _on_Area2D_area_exited(area):
	isOverlapping = false
