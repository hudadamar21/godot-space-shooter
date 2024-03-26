extends CharacterBody2D

@export var speed := 1000
var can_shot := true

signal laser(position)

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(640, 640)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * speed
	move_and_slide()
	
	if Input.is_action_just_pressed("shot") and can_shot:
		laser.emit($LaserStartPosition.global_position)
		can_shot = false
		$LaserCooldownTimer.start()
		$LaserSound.play()
	
	#position += direction * speed * delta
	
	#if Input.is_action_pressed("ui_right"):
		#position += Vector2(1,0) * 50 * delta
		#get_node("PlayerImage").rotation += 0.5 * delta
		#print('ook')
		#$PlayerImage.rotation += 0.5 * delta


func _on_laser_cooldown_timer_timeout():
	can_shot = true
