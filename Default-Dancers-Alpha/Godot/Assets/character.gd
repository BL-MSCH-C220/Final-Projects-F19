extends KinematicBody2D

var _dying = 0.1
var _dying_delta = 0.1
var _dying_threshold = 50
var speed=20
var character_health = 100
signal hit
onready var noise = get_node("/root/World/caw")
func _ready():
	set_process_input(true)
	#connect("score",WorldNODE,"increase_score")
	
func _input(event):
	if Input.is_action_pressed("up"):
		position.y -= speed
		$AnimatedSprite.play("Flying")
	if Input.is_action_pressed("down"):
		position.y += speed
		$AnimatedSprite.play("Flying")
	if Input.is_action_pressed("left"):
		position.x -= speed
		$AnimatedSprite.play("Flying")
	if Input.is_action_pressed("right"):
		position.x += speed
		$AnimatedSprite.play("Flying")
	if Input.is_action_pressed("space"):
		noise.playing = true

func _physics_process(delta):
	move_and_collide(Vector2(0,0))
	"""if _dying > 0:
		_dying += _dying_delta
		#position.y += _dying
	if _dying > _dying_threshold:
		queue_free()
"""
func kill():
	_dying += _dying_delta
	$CollisionShape2D.queue_free()
	
"""
func _hit_building(area):
	$character.die()
"""
func _on_Player_body_entered(body):
	hide()
	emit_signal("hit")
	$CollisionShape2D.disabled = true

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
