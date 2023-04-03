extends Node2D

func _ready():
	if Global.timeH <1:
		$CanvasLayer/DateandTime.StartTime()
