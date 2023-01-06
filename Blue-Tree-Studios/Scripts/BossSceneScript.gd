extends Node2D
onready var sound = get_node("/root/BossMusic")
onready var Lives2 = $"lives + etc/Lives"
onready var Hearts2 = [$"lives + etc/Lives/Sprite3", $"lives + etc/Lives/Sprite2", $"lives + etc/Lives/Sprite"]


onready var Lives = $"CanvasLayer/lives + etc/Lives"
onready var Hearts = [$"CanvasLayer/lives + etc/Lives/Sprite3", $"CanvasLayer/lives + etc/Lives/Sprite2", $"CanvasLayer/lives + etc/Lives/Sprite"]

var heart_full = load("res://Assets/New Piskel-1.png (2).png")
var heart_half = load("res://Assets/Half Heart-1.png (1).png")
var heart_empty = load("res://Assets/Half Heart-1.png.png")

var lives2 = 6
var lives = 6



func update_boss(delta):
	lives2 += delta
	for h in range(len(Hearts2)):
		Hearts2[h].texture = heart_full
		if lives2 < (h+1)*2:
			Hearts2[h].texture = heart_empty
		if lives2 == (h*2)+1:
			Hearts2[h].texture = heart_half
	if lives2 == 0:
		get_tree().change_scene("res://Scenes/WinScreen.tscn")

func update_lives(delta):
	lives += delta
	for h in range(len(Hearts)):
		Hearts[h].texture = heart_full
		if lives < (h+1)*2:
			Hearts[h].texture = heart_empty
		if lives == (h*2)+1:
			Hearts[h].texture = heart_half
	if lives == 0:
		get_tree().change_scene("res://Scenes/YouLose.tscn")

		