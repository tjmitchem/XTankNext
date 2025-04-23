extends Sprite2D

var speed = 0
var speed_multiplier = 0
var angular_speed = PI
var timer
var my_delta = 0


func _input(event):
	if event is InputEventKey:
		var keycode = event.keycode

		# If the key is [0-9], then set speed accordingly
		if event.pressed and keycode >= 48 and keycode < 57:
			speed = 100 * (keycode - 48)
			return

		if Input.is_action_pressed("ui_up"):
			speed_multiplier += 0.5
			speed = speed_multiplier * 100

		if Input.is_action_pressed("ui_down"):
			speed_multiplier -= 0.5
			speed = speed_multiplier * 100

		if Input.is_action_pressed("ui_end"):
			speed_multiplier = 0
			speed = speed_multiplier * 100
		
	return


func _on_timer_timeout():
	pass


func _ready():
	pass
	# timer = get_node("Timer")
	# timer.timeout.connect(_on_timer_timeout)
	# timer.start()


func rotate_sprite():
	var direction = 0
	if Input.is_action_pressed("ui_left"):
		direction = -1
	if Input.is_action_pressed("ui_right"):
		direction = 1

	rotation += angular_speed * direction * my_delta


func move_sprite():
	var velocity = Vector2.ZERO
	
	velocity = Vector2.UP.rotated(rotation) * speed * my_delta
	position += velocity


func _process(delta):
	my_delta = delta
	
	rotate_sprite()
	move_sprite()
