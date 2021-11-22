extends Node2D

onready var n1 = $Number1
onready var n2 = $Number2
onready var n3 = $Number3
onready var n4 = $Number4
onready var n5 = $Number5
onready var n6 = $Number6
onready var n7 = $Number7
onready var n8 = $Number8
onready var n9 = $Number9
onready var n10 = $Number10
onready var n11 = $Number11
onready var n12 = $Number12
onready var minutehand = $MinuteHand
onready var hourhand = $hourhand
onready var fixnumbers = $fixnumbers
onready var sethour = $sethour
onready var setmin = $setmin
onready var Done = $Done
onready var rand_time = $rand_time

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var hour = 0
var minute = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	seed(OS.get_unix_time())
	minutehand.set_process_input(false)
	hourhand.set_process_input(false)
	hour = randi()%12+1
	minute  = randi()%60
	rand_time.text = "Set Time: %d:%02d"%[hour,minute]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func write_test():
	var dir = Directory.new()
	var dir_name = "test_dir"
	var filename = "test_results_%s.txt"%OS.get_unix_time()
	var user_dir = "/storage/emulated/0/Download/"
	
	var err = dir.open(user_dir)
	
	if err != 0:
		print("open directory fail - " + user_dir)
		print("error code = %d" % err)
		return
	
	print("open directory success - " + user_dir)
	
	var f_name = user_dir + filename;
	var fp_user = File.new()
	err = fp_user.open( f_name, File.WRITE )
	
	if err != 0:
		print("open file fail - " + f_name)
		print("error code = %d" % err)
		return
	
	print("open file success - " + f_name)
	

	fp_user.store_line( "%s"%n1.get_position())
	fp_user.store_line( "%s"%n2.get_position())
	fp_user.store_line( "%s"%n3.get_position())
	fp_user.store_line( "%s"%n4.get_position())
	fp_user.store_line( "%s"%n5.get_position())
	fp_user.store_line( "%s"%n6.get_position())
	fp_user.store_line( "%s"%n7.get_position())
	fp_user.store_line( "%s"%n8.get_position())
	fp_user.store_line( "%s"%n9.get_position())
	fp_user.store_line( "%s"%n10.get_position())
	fp_user.store_line( "%s"%n11.get_position())
	fp_user.store_line( "%s"%n12.get_position())
	fp_user.store_line( "%s"%hourhand.get_rotation())
	fp_user.store_line( "%s"%minutehand.get_rotation())
	fp_user.store_line( "%d:%02d"%[hour,minute])
	fp_user.close()
	
	print( f_name + " written." )
	


func _on_fixnumbers_pressed():
	Globalstate.numbersenabled = false
	fixnumbers.disabled = true
	sethour.show()
	
	n1.set_process_input(false)
	n2.set_process_input(false)
	n3.set_process_input(false)
	n4.set_process_input(false)
	n5.set_process_input(false)
	n6.set_process_input(false)
	n7.set_process_input(false)
	n8.set_process_input(false)
	n9.set_process_input(false)
	n9.set_process_input(false)
	n10.set_process_input(false)
	n11.set_process_input(false)
	n12.set_process_input(false)
	hourhand.show()
	Globalstate.hourenabled = true
	#minutehand.set_process_input(true)
	#hourhand.set_process_input(true)

func _on_sethour_pressed():
	Globalstate.hourenabled = false
	Globalstate.minuteenabled = true
	sethour.disabled = true
	setmin.show()
	minutehand.show()


func _on_setmin_pressed():
	Globalstate.hourenabled = false
	Globalstate.minuteenabled = false
	setmin.disabled = true
	Done.show()

func _on_Done_pressed():
	Done.disabled = true
	write_test()
